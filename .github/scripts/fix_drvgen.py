#!/usr/bin/env python3
import sys
import re

with open('tools/dct/DrvGen.py', 'r', encoding='utf-8', errors='ignore') as f:
    content = f.read()

# 在文件开头添加 cmp 函数（如果不存在）
if 'def cmp(a, b):' not in content:
    cmp_func = '''def cmp(a, b):
    return (a > b) - (a < b)

'''
    # 在第一个 import 或 def 之前插入
    if 'import ' in content:
        content = cmp_func + content
    else:
        first_def = content.find('def ')
        if first_def != -1:
            content = content[:first_def] + cmp_func + content[first_def:]

# 修复 print 语句为 print 函数
content = re.sub(r"print\s+'([^']*)'", r"print('\1')", content)
content = re.sub(r'print\s+"([^"]*)"', r'print("\1")', content)

# 保存修复后的文件
with open('tools/dct/DrvGen.py', 'w', encoding='utf-8') as f:
    f.write(content)

print('✅ DrvGen.py 修复完成')

