#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: DockerRequirement
    dockerPull: ubuntu:bionic-20180426
  - class: InlineJavascriptRequirement

class: CommandLineTool

inputs:
  - id: input
    type: File
    inputBinding:
      position: 0

stdout: $(inputs.input.nameroot + ".ls")

outputs:
  - id: output
    type: File
    outputBinding:
      glob: $(inputs.input.nameroot + ".ls")
      
baseCommand: [ls, -l]
