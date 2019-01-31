declare-option str-to-str-map typeMap
set -add global typeMap c=c
set -add global typeMap h=c
set -add global typeMap cc=c
set -add global typeMap hh=c
set -add global typeMap go=java-cmt
set -add global typeMap sh=shell
set -add global typeMap kak=pound-cmt
set -add global typeMap lisp=lisp-cmt
set -add global typeMap java=java-cmt
set -add global typeMap html=html-cmt
set -add global typeMap vim=vim-cmt

define-command -override -params .. -docstring "box [<arguments>]: wrap selection using the boxes command line utility" box %{
    evaluate-commands %sh{
        echo "echo -debug $kak_opt_typeMap"
        for pair in $kak_opt_typeMap; do
            key=$(echo "$pair" | cut -d= -f1 | tr -d "'")
            value=$(echo "$pair" | cut -d= -f2 | tr -d "'")
            if [ "$key" = "$kak_opt_filetype" ]; then
                box_flag="-d $value"
                echo "echo -debug boxflag: $box_flag"
            else
                echo "echo -debug No match for $kak_opt_filetype"
            fi
        done

        COMMAND=$(echo "execute-keys |boxes<space>$(echo $box_flag $@ | sed 's/ /\<space\>/g')<ret>")

        echo "echo -debug $COMMAND"
        echo $COMMAND 
    }
}

define-command -override -params .. -docstring "unbox [<arguments>]: unwrap selection using the boxes command line utility" unbox %{
    # inverse
    box -r %arg{@}
}
