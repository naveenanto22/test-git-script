# Schema Manager

Performs schema specific code generation and maintains a separate branch for generated code. Helps to maintain code in sync with schema evolution.

## Usage

```yaml
- uses: naveenanto22/schemacodeman@v1
  with:
  
    # Comma separated languages for code generation as required by code generator.
    #
    # [ ex: 'js,csharp,python' for proto generator ]
    #
    # required
    
    languages: ''         
    
    
    # Comma separated schema files to be processed. Glob syntax compatible.
    #
    # [ ex: 'schema.json' (or) '*.proto,contract/*.proto' ]
    # 
    # required
    
    schema_files: ''     
    
    
    # Directory to place the generated code. 
    #
    # [ ex: 'generated/' (or) 'com/contract/generated']
    #
    # optional (default :'code/')
    
    codepath: ''          
    
    
    # Shell script that generates the code.`code_generator.sh` can't be used as filename
    # The file can also be a path relative to the workspace
    #
    # [ ex: 'custom_generator.sh' ,  'scripts/my_generator.sh']
    #
    # optional (default : 'code_generator.sh')
    
    code_generator: ''
    
    # Branch prefix name to be used while creating a code_branch per language 
    # format: [ branch name will be {branch_prefix}-{ref_branch_name}/{language} ]
    #
    # [ ex: 'auto-generated' might result in auto-generated-dev/java ]
    #
    # optional (default : 'gencode')
    
    branch_prefix: ''
    
    # Commit message to be used for each code generation. 
    # '_' is used to specify default behaviour or you can choose to ignore this field
    #
    # [ ex: 'Auto-generated code' ]
    #
    # optional (default : 'Code generated for {commit_sha}')
    
    commit_msg: '_'
```
