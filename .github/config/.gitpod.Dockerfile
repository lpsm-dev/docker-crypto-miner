FROM gitpod/workspace-full:build-branch-master

# Install custom tools, runtime, etc.
RUN brew install fzf \
        terraform \
        terraform-docs \
        tflint \
        norwoodj/tap/helm-docs
