define-command -override -params .. -docstring "box [<arguments>]: wrap selection using the boxes command line utility" box %{
    echo -debug %sh{
        echo "execute-keys |boxes<space>$@<ret>"
    }
    evaluate-commands %sh{
        echo "execute-keys |boxes<space>$@<ret>"
    }
}
