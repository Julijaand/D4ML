file = "output.txt"
store_command() {
    command="$@"
    echo "$command" >> "$file"
    eval "$command"
}

store_command aws s3 ls
store_command echo "Hello, AWS!"
