#!/usr/bin/env pwsh
# Setup implementation plan with adaptive reasoning chains
# Usage: ./setup-plan.ps1 -Json

[CmdletBinding()]
param(
    [switch]$Json
)

# Dot-source common functions
$ScriptDir = Split-Path $MyInvocation.MyCommand.Path
. "$ScriptDir\common.ps1"

# Find the current feature branch and spec
$currentBranch = ""
try {
    $currentBranch = git branch --show-current 2>$null
} catch {
    # If git command fails, continue with empty string
}

$specFile = ""
$featureDir = ""
$branchName = ""

if ($currentBranch -and $currentBranch -match '^\d+-') {
    $branchName = $currentBranch
    $featureDir = "${DEFAULT_SPECS_DIR}/${currentBranch}"
    $specFile = "${featureDir}/spec.md"
} else {
    # Try to find the most recent feature branch
    $specDirs = Get-ChildItem -Path $DEFAULT_SPECS_DIR -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^\d+-' }
    foreach ($dir in $specDirs) {
        $branchName = $dir.Name
        $featureDir = $dir.FullName
        $specFile = "${featureDir}/spec.md"
        if (Test-Path $specFile) {
            break
        }
    }
}

if (-not (Test-Path $specFile)) {
    if ($Json) {
        Write-Output "{}"
    } else {
        Write-Error "Error: No feature specification found in current branch or spec directories"
    }
    exit 1
}

# Define the implementation plan file path
$implPlanFile = "${featureDir}/plan.md"

# Create the implementation plan file with adaptive template
$planContent = @'
# Adaptive Implementation Plan: [FEATURE NAME]

**Feature**: [Feature name and brief description from spec]
**Created**: [DATE]
**Status**: Draft
**Plan Owner**: [TEAM/PERSON RESPONSIBLE]
**Evolution Plan**: [Reference to evolution pathways and adaptation mechanisms]
**Context Dependencies**: [List of environments and contexts this plan must support]

## Adaptive Technical Context & Architecture Evolution

### Current Adaptive Approach
[Describe the current best approach based on research and requirements with emphasis on adaptability]

### Alternative Adaptive Approaches Considered
- **Approach 1**: [Description] - Chosen against because [reasons]
- **Approach 2**: [Description] - Chosen against because [reasons]
- **Approach 3**: [Description] - Chosen because [reasons with adaptability focus]

### Technology Stack with Evolution Pathways
- **Core Technology 1**: [Specific technology] with [evolution strategy]
- **Core Technology 2**: [Specific technology] with [evolution strategy]
- **Framework/Libraries**: [List with migration paths and backward compatibility plans]

### Architecture Patterns for Adaptation
- **Pattern 1**: [Architecture pattern] supporting [types of changes]
- **Pattern 2**: [Architecture pattern] supporting [types of changes]
- **Pattern 3**: [Architecture pattern] supporting [types of changes]

## Adaptive Constitution Alignment & Evolution Verification

### Adaptive Architecture Compliance
- [ ] **Adaptive Architecture Principle**: [How the plan supports evolution and change] - Evolution Path: [How this adapts over time]
- [ ] **Test-First Development**: [How tests will be written first with adaptability] - Evolution Strategy: [How tests evolve with requirements]
- [ ] **Library-First Development**: [How features will be implemented as libraries] - Evolution Strategy: [How libraries evolve]
- [ ] **Context-Aware Design**: [How the plan accounts for different contexts] - Context Evolution: [How context requirements evolve]

### Adaptive Quality Gates Verification
- [ ] **Adaptability First**: [How the implementation prioritizes adaptability]
- [ ] **Evolution-Ready**: [How the implementation prepares for evolution]
- [ ] **Context-Independent Core**: [How core functionality works across contexts]

## Phase -1: Adaptive Pre-Implementation Gates

### Adaptive Simplicity Gate
- [ ] Using ≤3 projects/components that can evolve independently?
- [ ] No over-engineering for future needs that might not materialize?
- [ ] Minimal abstraction layers that support evolution?
- [ ] Core logic separated from adaptation mechanisms?

### Adaptive Integration-First Gate
- [ ] Contract tests defined before implementation with evolution considerations?
- [ ] Real dependencies used instead of mocks where appropriate for context testing?
- [ ] End-to-end validation planned for different contexts and evolution paths?
- [ ] Adaptation mechanisms tested alongside core functionality?

## Phase 0: Adaptive Research & Preparation

### Adaptive Research Tasks
- **Research Task 1**: [Specific research task] - Goal: [How this informs adaptation strategy]
- **Research Task 2**: [Specific research task] - Goal: [How this informs adaptation strategy]
- **Research Task 3**: [Specific research task] - Goal: [How this informs adaptation strategy]

### Unknowns Resolution with Learning Integration
- **Unknown 1**: [How identified unknown from technical context will be resolved] - Learning: [How to incorporate lessons learned]
- **Unknown 2**: [How identified unknown from technical context will be resolved] - Learning: [How to incorporate lessons learned]

### Adaptive Risk Assessment with Evolution Planning
- **Risk 1**: [Potential risk in implementation] - Adaptation Strategy: [How to adapt if this risk materializes]
- **Risk 2**: [Potential risk in implementation] - Adaptation Strategy: [How to adapt if this risk materializes]
- **Risk 3**: [Potential risk in implementation] - Adaptation Strategy: [How to adapt if this risk materializes]

### Context Risk Assessment
- **Context Risk 1**: [Risk specific to context changes] - Mitigation: [How to handle context changes]
- **Context Risk 2**: [Risk specific to context changes] - Mitigation: [How to handle context changes]

## Phase 1: Adaptive Design & Architecture

### Adaptive Data Model Design
- **Core Schema**: [Plan for core data model that remains stable] - Evolution Strategy: [How schema evolves]
- **Flexible Fields**: [Plan for data fields that may change] - Adaptation Strategy: [How to handle field changes]
- **Context-Specific Data**: [Plan for context-dependent data] - Context Handling: [How to manage context data]

### Adaptive API Contract Design
- **Stable Contract Elements**: [API elements that should remain stable] - Stability Plan: [How to maintain stability]
- **Flexible Contract Elements**: [API elements that may evolve] - Evolution Plan: [How these elements evolve]
- **Context-Specific Endpoints**: [API endpoints for specific contexts] - Context Adaptation: [How to handle context changes]

### Adaptive Component Architecture
- **Component 1**: [Component design] - Evolution Path: [How this component evolves]
- **Component 2**: [Component design] - Evolution Path: [How this component evolves]
- **Component 3**: [Component design] - Evolution Path: [How this component evolves]

### Adaptive Connection Planning
- **Connection 1**: [How components connect] - Adaptation: [How connections adapt to changes]
- **Connection 2**: [How components connect] - Adaptation: [How connections adapt to changes]

### Adaptive Design Elements with Schema Evolution
- **Element 1**: [Design element for future evolution] - Schema Evolution: [Migration strategy]
- **Element 2**: [Design element for future evolution] - Schema Evolution: [Migration strategy]

## Phase 2: Adaptive Implementation Planning

### Adaptive Task Breakdown
- **Task 1**: [High-level task] - Adaptation Strategy: [How this task adapts if requirements change]
- **Task 2**: [High-level task] - Adaptation Strategy: [How this task adapts if requirements change]
- **Task 3**: [High-level task] - Adaptation Strategy: [How this task adapts if requirements change]

### Adaptive Implementation Order
- **Priority 1**: [Components to implement first] - Reason: [Why this supports adaptation]
- **Priority 2**: [Components to implement second] - Reason: [Why this supports adaptation]
- **Priority 3**: [Components to implement third] - Reason: [Why this supports adaptation]

### Adaptive Testing Strategy
- **Contract Tests**: [Plan for contract tests with evolution considerations]
- **Integration Tests**: [Plan for integration tests with context awareness]
- **E2E Tests**: [Plan for end-to-end tests across different contexts]
- **Unit Tests**: [Plan for unit tests with adaptability focus]
- **Evolution Tests**: [Plan for tests that verify evolution capabilities]

### Adaptive Success Criteria Validation
- **Current Metrics**: [How success criteria from spec will be validated currently]
- **Evolution Metrics**: [How success criteria will be validated as requirements evolve]
- **Context Metrics**: [How success criteria will be validated across different contexts]

## Adaptive Implementation Details

### Adaptive File Creation Order
1. Create `contracts/` with API specifications that support evolution
2. Create test files in order: contract → integration → e2e → unit with adaptation validation
3. Create source files to make tests pass with adaptability built-in
4. Add adaptation mechanisms to `adapters/` subdirectory
5. Add implementation details to `implementation-details/` subdirectory

### Adaptive Implementation Principles
- **Principle 1**: [Core principle for adaptive implementation] - How: [How to apply this principle]
- **Principle 2**: [Core principle for adaptive implementation] - How: [How to apply this principle]
- **Principle 3**: [Core principle for adaptive implementation] - How: [How to apply this principle]

## Adaptive Implementation Considerations with Learning Mechanisms

### Evolution Strategies by Component
- **Component Evolution**: [How each component can adapt to changing requirements]
- **Interface Evolution**: [How interfaces can evolve while maintaining compatibility]
- **Data Evolution**: [How data schemas can evolve with backward compatibility]

### Adaptive Monitoring and Feedback Loops
- **Adaptation Metrics**: [How the implementation will track adaptation effectiveness]
- **Context Performance**: [How the implementation will monitor performance across contexts]
- **Evolution Readiness**: [How the implementation will measure readiness for evolution]
- **Feedback Integration**: [How user feedback will inform adaptations]

### Adaptive Rollback and Recovery Plans
- **Immediate Rollback**: [How to revert changes quickly if needed]
- **Gradual Rollback**: [How to partially revert changes while preserving others]
- **Context Isolation**: [How to isolate context-specific issues]

## Adaptive Complexity Management & Evolution Planning

### Complexity Justification with Adaptability
- **Complexity 1**: [Justification for complexity that supports adaptation]
- **Complexity 2**: [Justification for complexity that enables evolution]

### Adaptive Complexity Limits
- [ ] No component has >7 methods/functions that need to evolve together
- [ ] No module has >500 lines that need to change together for evolution
- [ ] No dependency tree is >3 levels deep for easy evolution

## Adaptive Evolution Roadmap

### Short-term Evolution (0-6 months)
- [ ] [Evolution goal 1] - Priority: [High/Medium/Low]
- [ ] [Evolution goal 2] - Priority: [High/Medium/Low]
- [ ] [Evolution goal 3] - Priority: [High/Medium/Low]

### Medium-term Evolution (6-18 months)
- [ ] [Evolution goal 1] - Priority: [High/Medium/Low]
- [ ] [Evolution goal 2] - Priority: [High/Medium/Low]
- [ ] [Evolution goal 3] - Priority: [High/Medium/Low]

### Long-term Evolution (18+ months)
- [ ] [Evolution goal 1] - Priority: [High/Medium/Low]
- [ ] [Evolution goal 2] - Priority: [High/Medium/Low]
- [ ] [Evolution goal 3] - Priority: [High/Medium/Low]

## Adaptive Context Management

### Context A Implementation Plan
- **Requirements**: [How implementation works in Context A]
- **Adaptation**: [How implementation adapts in Context A]
- **Validation**: [How to validate in Context A]

### Context B Implementation Plan
- **Requirements**: [How implementation works in Context B]
- **Adaptation**: [How implementation adapts in Context B]
- **Validation**: [How to validate in Context B]

### Context C Implementation Plan
- **Requirements**: [How implementation works in Context C]
- **Adaptation**: [How implementation adapts in Context C]
- **Validation**: [How to validate in Context C]

## Adaptive Reasoning Chain Documentation

### Decision Traceability with Evolution Impact
- **Decision 1**: [Why this decision was made in implementation plan] - Evolution Impact: [How this affects future evolution]
- **Decision 2**: [Why this decision was made in implementation plan] - Evolution Impact: [How this affects future evolution]

### Learning Opportunities Integration
- **Opportunity 1**: [How to improve implementation process based on this plan]
- **Opportunity 2**: [How to improve implementation process based on this plan]

## Adaptive Monitoring & Observability Strategy

### Adaptation Effectiveness Metrics
- **Metric 1**: [How to measure if adaptations are working]
- **Metric 2**: [How to measure if adaptations are working]
- **Metric 3**: [How to measure if adaptations are working]

### Context Performance Metrics
- **Context A**: [Metrics for performance in Context A]
- **Context B**: [Metrics for performance in Context B]
- **Context C**: [Metrics for performance in Context C]

### Evolution Readiness Metrics
- **Readiness 1**: [Metric for measuring evolution readiness]
- **Readiness 2**: [Metric for measuring evolution readiness]

## Adaptive Risk Management & Safety Measures

### Evolution Risk Mitigation
- **Risk 1**: [Risk related to evolution] - Mitigation: [How to mitigate this risk]
- **Risk 2**: [Risk related to evolution] - Mitigation: [How to mitigate this risk]

### Context Switching Risk Mitigation
- **Risk 1**: [Risk related to context switching] - Mitigation: [How to mitigate this risk]
- **Risk 2**: [Risk related to context switching] - Mitigation: [How to mitigate this risk]

### Backward Compatibility Safeguards
- [ ] [Safeguard 1] - How: [How this safeguard works]
- [ ] [Safeguard 2] - How: [How this safeguard works]
- [ ] [Safeguard 3] - How: [How this safeguard works]

## Adaptive Next Steps with Evolution Tracking

### Immediate Actions (This Week)
1. [ ] [Action 1] - Impact: [How this supports adaptation]
2. [ ] [Action 2] - Impact: [How this supports adaptation]
3. [ ] [Action 3] - Impact: [How this supports adaptation]

### Short-term Actions (This Month)
1. [ ] [Action 1] - Evolution Path: [How this enables evolution]
2. [ ] [Action 2] - Evolution Path: [How this enables evolution]
3. [ ] [Action 3] - Evolution Path: [How this enables evolution]

### Long-term Actions (Ongoing)
1. [ ] [Action 1] - Continuous Evolution: [How this supports ongoing adaptation]
2. [ ] [Action 2] - Continuous Evolution: [How this supports ongoing adaptation]
3. [ ] [Action 3] - Continuous Evolution: [How this supports ongoing adaptation]

'@

Set-Content -Path $implPlanFile -Value $planContent -Encoding UTF8

# Define paths for other artifacts that will be created
$researchFile = "${featureDir}/research.md"
$dataModelFile = "${featureDir}/data-model.md"
$quickstartFile = "${featureDir}/quickstart.md"

# Create placeholder files that will be filled in later
New-Item -Path $researchFile -ItemType File -Force | Out-Null
New-Item -Path $dataModelFile -ItemType File -Force | Out-Null
New-Item -Path $quickstartFile -ItemType File -Force | Out-Null

# Output the result
if ($Json) {
    $result = @{
        FEATURE_SPEC = $specFile
        IMPL_PLAN = $implPlanFile
        SPECS_DIR = $featureDir
        BRANCH = $branchName
        RESEARCH_FILE = $researchFile
        DATA_MODEL_FILE = $dataModelFile
        QUICKSTART_FILE = $quickstartFile
    }
    $result | ConvertTo-Json
} else {
    Write-Output "Created implementation plan: $implPlanFile"
    Write-Output "Feature spec: $specFile"
    Write-Output "Branch: $branchName"
    Write-Output "Research file: $researchFile"
    Write-Output "Data model: $dataModelFile"
    Write-Output "Quickstart guide: $quickstartFile"
}