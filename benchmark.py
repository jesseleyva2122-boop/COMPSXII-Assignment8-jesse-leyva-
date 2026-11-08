"""Reproduce three independent runs per optimization level (Python standard library)."""
from pathlib import Path
import csv, re, statistics, subprocess
root = Path(__file__).resolve().parent
out = root / 'evidence'
out.mkdir(exist_ok=True)
rows=[]
for level in (0,2,3):
    exe = root / f'cache_O{level}'
    subprocess.run(['gcc',f'-O{level}','-std=c11','-Wall','-Wextra','-Wpedantic',str(root/'cache_lab.c'),'-o',str(exe)],check=True)
    for trial in range(1,4):
        text=subprocess.check_output([str(exe)],text=True)
        (out/f'O{level}_run{trial}.txt').write_text(text)
        blocks=re.findall(r'Matrix Size: (\d+) x \d+.*?Row-major:\s+([\d.]+) ms \(sum: (\d+)\).*?Column-major:\s+([\d.]+) ms \(sum: (\d+)\)',text,re.S)
        assert len(blocks)==4
        for n,r,rs,c,cs in blocks:
            assert rs==cs and int(rs)==int(n)**2*99//2
            rows.append([level,trial,int(n),float(r),float(c),int(rs)])
with (out/'measurements.csv').open('w',newline='') as f:
    writer=csv.writer(f);writer.writerow(['optimization','trial','matrix_size','row_ms','column_ms','sum']);writer.writerows(rows)
print('Raw results saved. Update analysis.md if you rerun on different hardware.')
