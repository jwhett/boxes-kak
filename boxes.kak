# Fail if boxes is unavailable
evaluate-commands %sh{
    [ -z $(command -v boxes) ] && echo "fail Missing dependency: boxes"
}

# Define a map of filetype -> boxcomments for default boxing
# behavior. If undefined, we fall back on boxes' default.
declare-option str-to-str-map typeMap
set -add global typeMap c=c
set -add global typeMap h=c
set -add global typeMap cc=c
set -add global typeMap hh=c
set -add global typeMap go=java-cmt
set -add global typeMap sh=shell
set -add global typeMap kak=shell
set -add global typeMap lisp=lisp-cmt
set -add global typeMap java=java-cmt
set -add global typeMap html=html-cmt
set -add global typeMap vim=vim-cmt

define-command -override -params .. -docstring "box [<arguments>]: wrap selection using the boxes command line utility" box %{
    evaluate-commands %sh{
        for pair in $kak_opt_typeMap; do
            # The map is handed to us as 'key=value' so we need to
            # trim the single-quotes.
            key=$(echo "$pair" | cut -d= -f1 | tr -d "'")
            value=$(echo "$pair" | cut -d= -f2 | tr -d "'")
            if [ "$key" = "$kak_opt_filetype" ]; then
                box_flag="-d $value"
            fi
        done

        # Prepend our default. This is overridden if the user defines
        # a box type.
        COMMAND=$(echo "execute-keys |boxes<space>$(echo $box_flag $@ | sed 's/ /\<space\>/g')<ret>")
        echo $COMMAND 
    }
}

define-command -override -params .. -docstring "unbox [<arguments>]: unwrap selection using the boxes command line utility" unbox %{
    # Inverse; relies on boxes' default "unboxing" behavior.
    box -r %arg{@}
}
