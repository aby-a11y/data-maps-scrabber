import site, os

for d in site.getsitepackages():
    f = os.path.join(d, 'botasaurus_server', 'run.py')
    if os.path.exists(f):
        content = open(f).read()
        print('=== ORIGINAL ===')
        print(content[:500])

        # Disable frontend
        content = content.replace('run_frontend(False)', 'pass  # patched')
        content = content.replace('run_frontend(True)', 'pass  # patched')

        # Fix HOST - 0.0.0.0 zaroori hai Railway ke liye
        content = content.replace("host='127.0.0.1'", "host='0.0.0.0'")
        content = content.replace('host="127.0.0.1"', 'host="0.0.0.0"')
        content = content.replace("host='localhost'", "host='0.0.0.0'")

        # Fix PORT from env
        content = content.replace(
            "port=8000",
            "port=int(os.environ.get('PORT', 8000))"
        )

        open(f, 'w').write(content)
        print('Patched:', f)
        print('=== PATCHED ===')
        print(open(f).read()[:500])
