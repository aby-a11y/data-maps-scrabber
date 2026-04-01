import site, os
for d in site.getsitepackages():
    f = os.path.join(d, 'botasaurus_server', 'run.py')
    if os.path.exists(f):
        content = open(f).read()
        content = content.replace('run_frontend(False)', 'pass  # patched')
        content = content.replace('run_frontend(True)', 'pass  # patched')
        open(f, 'w').write(content)
        print('Patched:', f)
