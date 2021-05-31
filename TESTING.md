# Testing

To test the container before publication, run these steps.

1. `container_hash=$(podman build . -q)`.
2. Run: `podman run --privileged --tty --interactive -p 8080:8080 ${container_hash} --makeconf`.
3. Navigate to `http://localhost:8080`.
