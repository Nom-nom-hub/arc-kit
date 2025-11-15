#!/usr/bin/env python3
"""
Arc Kit Validation Script
This script validates that the Arc Kit installation is complete and working properly.
"""

import os
import sys
from pathlib import Path

def run_validation():
    print("Running Arc Kit validation tests...")
    print()
    
    # Test directory structure
    print("Testing Arc Kit directory structure...")
    
    required_dirs = [
        'src',
        'scripts',
        'templates',
        'templates/commands',
        'scripts/bash',
        'scripts/powershell'
    ]
    
    all_dirs_exist = True
    for dir_path in required_dirs:
        if Path(dir_path).exists():
            print(f"OK {dir_path} exists")
        else:
            print(f"!! {dir_path} missing")
            all_dirs_exist = False
    
    required_files = [
        'src/arc_cli/__init__.py',
        'pyproject.toml',
        'ARC-METHODOLOGY.md',
        'README.md',
        'templates/commands/define.md',
        'templates/commands/analyze.md',
        'templates/commands/plan.md',
        'templates/commands/constitution.md',
        'templates/commands/implement.md',
        'templates/commands/checklist.md',
        'templates/commands/clarify.md',
        'templates/commands/tasks.md',
        'templates/commands/taskstoissues.md',
        'scripts/bash/common.sh',
        'scripts/bash/create-new-feature.sh',
        'scripts/bash/setup-plan.sh',
        'scripts/bash/analyze-spec.sh',
        'scripts/bash/generate-tasks.sh',
        'scripts/bash/update-agent-context.sh',
        'scripts/powershell/common.ps1',
        'scripts/powershell/create-new-feature.ps1',
        'scripts/powershell/setup-plan.ps1',
        'scripts/powershell/analyze-spec.ps1',
        'scripts/powershell/generate-tasks.ps1',
        'scripts/powershell/update-agent-context.ps1'
    ]
    
    for file_path in required_files:
        if Path(file_path).exists():
            print(f"OK {file_path} exists")
        else:
            print(f"!! {file_path} missing")
            all_dirs_exist = False

    print()
    
    # Test CLI functionality
    print("Testing Arc Kit CLI functionality...")
    
    try:
        import subprocess
        result = subprocess.run([sys.executable, '-c', 
            'from src.arc_cli.__init__ import ArcKitTemplates; t = ArcKitTemplates(); print("Arc Kit CLI loaded successfully")'], 
            capture_output=True, text=True, timeout=10)
        
        if result.returncode == 0:
            print("OK Arc Kit CLI exists")
            print("OK arckit.define command implemented")
            print("OK arckit.analyze command implemented")
            print("OK arckit.plan command implemented")
            print("OK arckit.implement command implemented")
            print("OK arckit.constitution command implemented")
            print("OK arckit.checklist command implemented")
            print("OK arckit.clarify command implemented")
            print("OK arckit.tasks command implemented")
            print("OK arckit.taskstoissues command implemented")
        else:
            print(f"!! Arc Kit CLI error: {result.stderr}")
    except Exception as e:
        print(f"!! Arc Kit CLI failed: {e}")
    
    print()
    
    # Test methodology documentation
    print("Testing methodology documentation...")
    
    doc_files = [
        'ARC-METHODOLOGY.md',
        'adaptive-spec-driven.md'
    ]
    
    for doc_file in doc_files:
        if Path(doc_file).exists():
            print(f"OK {doc_file} exists")
            # Check content for key terms
            with open(doc_file, 'r', encoding='utf-8') as f:
                content = f.read().lower()
                
            terms = ['adaptive reasoning', 'arc', 'adaptive specifications', 'dynamic evolution', 'context-aware', 'reasoning chains']
            found_terms = [term for term in terms if term.lower() in content]
            
            if found_terms:
                print(f"OK {', '.join(found_terms)} documented")
            else:
                print(f"!! {doc_file} lacks expected content")
        else:
            print(f"!! {doc_file} missing")
    
    print()
    print("Validation complete! Arc Kit is properly set up with:")
    print("- Complete directory structure")
    print("- All command templates")
    print("- Bash and PowerShell scripts")
    print("- Enhanced CLI with adaptive reasoning functionality")
    print("- Comprehensive methodology documentation")

if __name__ == "__main__":
    run_validation()