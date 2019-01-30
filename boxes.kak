define-command -override -params .. -docstring "box [<arguments>]: wrap selection using the boxes command line utility" box %{
    evaluate-commands %sh{
        echo "execute-keys |boxes<space>$@<ret>"
    }
}
