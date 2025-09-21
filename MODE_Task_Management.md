# Task Management Mode

**Purpose**: Hierarchical task organization with persistent memory for complex multi-step operations

## Activation Triggers
- Operations with >3 steps requiring coordination
- Multiple file/directory scope (>2 directories OR >3 files)
- Complex dependencies requiring phases
- Manual flags: `--task-manage`, `--delegate`
- Quality improvement requests: polish, refine, enhance

## Task Hierarchy with Memory

📋 **Plan** → write_memory("plan", goal_statement)
→ 🎯 **Phase** → write_memory("phase_X", milestone)
  → 📦 **Task** → write_memory("task_X.Y", deliverable)
    → ✓ **Todo** → TodoWrite + write_memory("todo_X.Y.Z", status)

## Memory Operations

### Session Start
```
1. list_memories() → Show existing task state
2. read_memory("current_plan") → Resume context
3. think_about_collected_information() → Understand where we left off
```

### During Execution
```
1. write_memory("task_2.1", "completed: auth middleware")
2. think_about_task_adherence() → Verify on track
3. Update TodoWrite status in parallel
4. write_memory("checkpoint", current_state) every 30min
```

### Session End
```
1. think_about_whether_you_are_done() → Assess completion
2. write_memory("session_summary", outcomes)
3. delete_memory() for completed temporary items
```

## Execution Pattern

1. **Load**: list_memories() → read_memory() → Resume state
2. **Plan**: Create hierarchy → write_memory() for each level  
3. **Track**: TodoWrite + memory updates in parallel
4. **Execute**: Update memories as tasks complete
5. **Checkpoint**: Periodic write_memory() for state preservation
6. **Complete**: Final memory update with outcomes

## Tool Selection

| Task Type | Primary Tool | Memory Key |
|-----------|-------------|------------|
| Analysis | Sequential MCP | "analysis_results" |
| Implementation | MultiEdit/Morphllm | "code_changes" |
| UI Components | Magic MCP | "ui_components" |
| Testing | Playwright MCP | "test_results" |
| Documentation | Context7 MCP | "doc_patterns" |

## Memory Schema

```
plan_[timestamp]: Overall goal statement
phase_[1-5]: Major milestone descriptions
task_[phase].[number]: Specific deliverable status
todo_[task].[number]: Atomic action completion
checkpoint_[timestamp]: Current state snapshot
blockers: Active impediments requiring attention
decisions: Key architectural/design choices made
env_[task_id]: Nix environment configuration for task
tool_[agent_id]: Tool availability and environment state
```

## Nix Environment Integration

### Environment-Aware Memory Operations
**Priority**: 🟡 **Triggers**: Multi-step operations, tool-dependent tasks, agent distribution

- **Environment Specification**: Record nix-shell configurations in memory for task resumption
- **Tool Availability Tracking**: Monitor which tools are available in each task environment
- **Agent Environment Mapping**: Route tasks to agents with appropriate nix package sets
- **Session Environment Persistence**: Restore tool environments when resuming complex tasks
- **Cross-Session Tool Continuity**: Maintain consistent environments across session breaks

### Tool Environment Categories

| Task Category | Nix Environment | Memory Key Pattern |
|---------------|-----------------|-------------------|
| Version Control | `nix-shell -p git git-lfs` | "env_git_[task_id]" |
| Frontend Dev | `nix-shell -p nodejs npm yarn` | "env_frontend_[task_id]" |
| Backend Dev | `nix-shell -p python3 pip poetry` | "env_backend_[task_id]" |
| Systems Dev | `nix-shell -p cargo rustc go` | "env_systems_[task_id]" |
| Analysis | `nix-shell -p eslint pylint shellcheck` | "env_analysis_[task_id]" |
| Multi-Language | `nix-shell -p git nodejs python3 cargo` | "env_multi_[task_id]" |

### Memory Operations with Environment Context

#### Session Start with Environment Restoration
```
1. list_memories() → Show existing task state AND environment configs
2. read_memory("current_plan") → Resume context
3. read_memory("env_[active_task]") → Restore tool environment
4. think_about_collected_information() → Understand where we left off
5. Verify nix-shell availability for required tools
```

#### During Execution with Environment Tracking
```
1. write_memory("task_2.1", "completed: auth middleware")
2. write_memory("env_task_2.1", "nix-shell -p nodejs npm eslint")
3. think_about_task_adherence() → Verify on track
4. Update TodoWrite status in parallel
5. write_memory("checkpoint", current_state + environment_state) every 30min
```

#### Agent Distribution with Environment Specification
```
1. Analyze task requirements → Determine tool dependencies
2. write_memory("agent_frontend", "nix-shell -p nodejs npm yarn")
3. write_memory("agent_backend", "nix-shell -p python3 pip poetry")
4. Spawn agents with appropriate environment configurations
5. Track tool availability per agent in memory
```

### Complex Task Environment Patterns

**Multi-Phase Development Task**:
```bash
# Phase 1: Analysis (Analysis Agent)
nix-shell -p eslint pylint shellcheck --run 'analyze_codebase'
write_memory("phase_1_env", "nix-shell -p eslint pylint shellcheck")

# Phase 2: Implementation (Language-specific Agents)
nix-shell -p nodejs npm --run 'implement_frontend' &
nix-shell -p python3 pip --run 'implement_backend' &
write_memory("phase_2_env", "parallel: frontend+backend agents")

# Phase 3: Integration (Multi-tool Agent)
nix-shell -p git nodejs python3 --run 'integration_testing'
write_memory("phase_3_env", "nix-shell -p git nodejs python3")
```

**Agent Automation with Tool Environments**:
```bash
# Extended agent automation with environment awareness
cd ~ && nix-shell -p git nodejs python3 expect --run 'expect -c "
  spawn npx @anthropic-ai/claude-code --dangerously-skip-permissions \"[TASK]\"
  expect { -re {.*bypass permissions.*} { send \"2\r\" } }
  expect { -re {.*Write.*} { exit 0 } timeout { exit 1 } }
"'
write_memory("agent_env_[task_id]", "nix-shell -p git nodejs python3 expect")
```

### Environment Optimization Rules

- **Tool Grouping**: Combine related packages in single nix-shell for efficiency
- **Agent Specialization**: Route tasks to agents with pre-configured tool environments
- **Parallel Tool Categories**: Run independent tool operations in separate nix shells
- **Environment Caching**: Reuse nix-shell environments for similar task types
- **Dependency Validation**: Verify tool availability before task execution

### Environment Memory Examples

#### Task with Environment Context
```
write_memory("task_1.3", "status: implementing auth, env: nix-shell -p nodejs npm eslint")
write_memory("env_task_1.3", "tools: node v18.17.0, npm v9.6.7, eslint v8.44.0")
write_memory("tool_dependencies_1.3", "requires: jest for testing, typescript for compilation")
```

#### Agent Environment Tracking
```
write_memory("agent_frontend_env", "nix-shell -p nodejs npm yarn typescript")
write_memory("agent_backend_env", "nix-shell -p python3 pip poetry pytest")
write_memory("agent_devops_env", "nix-shell -p git docker kubernetes-cli")
```

#### Cross-Session Environment Restoration
```
read_memory("phase_2_env") → "nix-shell -p nodejs python3 cargo"
think_about_collected_information() → "Multi-language development phase"
nix-shell -p nodejs python3 cargo --run 'resume_development_tasks'
```

## Examples

### Session 1: Start Authentication Task
```
list_memories() → Empty
write_memory("plan_auth", "Implement JWT authentication system")
write_memory("phase_1", "Analysis - security requirements review")
write_memory("task_1.1", "pending: Review existing auth patterns")
write_memory("env_analysis", "nix-shell -p nodejs npm eslint shellcheck")
TodoWrite: Create 5 specific todos
nix-shell -p nodejs npm --run 'analyze_auth_patterns'
Execute task 1.1 → write_memory("task_1.1", "completed: Found 3 patterns")
write_memory("env_task_1.1", "nix-shell -p nodejs npm - analysis complete")
```

### Session 2: Resume After Interruption
```
list_memories() → Shows plan_auth, phase_1, task_1.1, env_analysis
read_memory("plan_auth") → "Implement JWT authentication system"
read_memory("env_analysis") → "nix-shell -p nodejs npm eslint shellcheck"
think_about_collected_information() → "Analysis complete, start implementation"
think_about_task_adherence() → "On track, moving to phase 2"
write_memory("phase_2", "Implementation - middleware and endpoints")
write_memory("env_phase_2", "nix-shell -p nodejs npm typescript jest")
nix-shell -p nodejs npm typescript --run 'start_implementation'
Continue with implementation tasks...
```

### Session 3: Completion Check with Environment Cleanup
```
read_memory("env_phase_2") → "nix-shell -p nodejs npm typescript jest"
nix-shell -p nodejs npm jest --run 'run_test_suite'
think_about_whether_you_are_done() → "Testing phase complete, validation needed"
write_memory("outcome_auth", "Successfully implemented with 95% test coverage")
write_memory("final_env", "nix-shell -p nodejs npm jest - all tests passing")
delete_memory("checkpoint_*") → Clean temporary states
delete_memory("env_task_*") → Clean environment states for completed tasks
write_memory("session_summary", "Auth system complete and validated, env cleaned")
```

### Session 4: Multi-Agent Distributed Task
```
list_memories() → Shows plan_microservices, phase_1_complete
read_memory("plan_microservices") → "Build user service, auth service, gateway"
write_memory("agent_user_service", "nix-shell -p nodejs npm typescript")
write_memory("agent_auth_service", "nix-shell -p python3 pip poetry")
write_memory("agent_gateway", "nix-shell -p go gopls")
write_memory("env_coordination", "nix-shell -p git docker-compose")

# Parallel agent execution with environment tracking
TodoWrite: Create distributed tasks for each service
(nix-shell -p nodejs npm typescript --run 'implement_user_service') &
(nix-shell -p python3 pip poetry --run 'implement_auth_service') &
(nix-shell -p go gopls --run 'implement_gateway') &

# Track progress with environment context
write_memory("task_user_service", "in_progress: REST endpoints, env: nodejs")
write_memory("task_auth_service", "in_progress: JWT validation, env: python3")
write_memory("task_gateway", "in_progress: routing logic, env: go")

## Session Task Management Results (COMPREHENSIVE)

### ✅ **Task Management Infrastructure Discoveries**:
```bash
# Multi-System Task Coordination:
write_memory("infrastructure_mapping", "8 Azure datacenters discovered")
write_memory("network_topology", "10.1.0.0/20 + 172.17.0.0/16 consistent")
write_memory("system_specs", "AMD EPYC 7763, 16GB RAM, 150GB storage")
write_memory("user_privileges", "ADM + Docker + Sudo across all systems")
write_memory("tool_arsenal", "200+ tools validated via nix-shell")

# Performance Task Results:
write_memory("tree_optimization", "2.35x speedup validated (103s vs 242s)")
write_memory("parallel_execution", "7 concurrent workflows successful")
write_memory("local_performance", "23x faster (2s vs 46s GitHub Actions)")
```

### ❌ **Task Management Failures Analyzed**:
```bash
# Complex Task Coordination Failures:
write_memory("nix_nesting_issue", "Local nested environments cause errors")
write_memory("yaml_syntax_issue", "Complex bash breaks GitHub Actions")
write_memory("cross_job_piping", "Variable parsing fails between tasks")
write_memory("privatization_timing", "Early private repos block execution")

# Task Execution Pattern Failures:
write_memory("command_substitution", "$(command) fails in CI/CD YAML")
write_memory("complex_parsing", "Multi-step bash expansions break")
```

### 🔧 **Validated Task Management Patterns**:
```bash
# ✅ WORKING: Simple task environments
write_memory("task_pattern_local", "nix-shell -p comprehensive-tools --run 'all ops'")
write_memory("task_pattern_cicd", "nix-shell -p specific-tool --run 'simple cmd'")

# ✅ WORKING: Task coordination
write_memory("parallel_tasks", "Multiple nix-shell environments concurrent")
write_memory("artifact_management", "Download before privatization")
```
```