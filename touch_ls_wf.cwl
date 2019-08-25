#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: Workflow

inputs:
  - id: filename
    type: string

outputs:
  - id: ls_output
    type: File
    outputSource: ls_file/output

steps:
  - id: create_file
    run: touch.cwl
    in:
      - id: input
        source: filename
    out:
      - id: output

  - id: ls_file
    run: ls.cwl
    in:
      - id: input
        source: create_file/output
    out:
      - id: output
