define-command -override -params .. -docstring "box [<arguments>]: wrap selection using the boxes command line utility" box %{
    evaluate-commands %sh{
        COMMAND=$(echo "execute-keys |boxes<space>$(echo $@ | sed 's/ /\<space\>/g')<ret>")
        echo "echo -debug $COMMAND"
        echo $COMMAND 
    }
}

define-command -override -params .. -docstring "unbox [<arguments>]: unwrap selection using the boxes command line utility" unbox %{
    # inverse
    box -r %arg{@}
}
