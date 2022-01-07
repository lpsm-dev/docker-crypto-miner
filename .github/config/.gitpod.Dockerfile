FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN brew install fzf \
        terraform \
        terraform-docs \
        tflint
