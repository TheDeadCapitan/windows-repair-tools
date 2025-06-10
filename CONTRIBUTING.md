# Contributing to Windows Repair Tools

First off, thank you for considering contributing to Windows Repair Tools! It's people like you that make this tool collection better for everyone.

## Code of Conduct

By participating in this project, you are expected to uphold our principles:
- Be respectful and inclusive
- Welcome newcomers and help them get started
- Focus on what is best for the community
- Show empathy towards other community members

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When you create a bug report, include:

- **Clear title and description**
- **Steps to reproduce**
- **Expected behavior**
- **Actual behavior**
- **Windows version**
- **Error messages (if any)**
- **Screenshots (if applicable)**

### Suggesting Enhancements

Enhancement suggestions are welcome! Please provide:

- **Clear title and description**
- **Use case scenario**
- **Proposed implementation approach**
- **Any mockups or examples**

### Adding New Tools

To add a new repair tool:

1. **Follow the existing format**:
   - Include ASCII art header
   - Implement admin check
   - Create menu system
   - Add progress indicators
   - Include proper error handling

2. **Tool requirements**:
   - Must use only built-in Windows utilities
   - Should work on Windows 7 and above
   - Include clear user instructions
   - Add confirmation for destructive operations

3. **Documentation**:
   - Update README.md with tool description
   - Add usage examples
   - Document any specific requirements

### Pull Request Process

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/YourFeatureName`
3. **Make your changes**
4. **Test thoroughly** on different Windows versions
5. **Commit with clear messages**: `git commit -m "Add: Network adapter reset feature"`
6. **Push to your fork**: `git push origin feature/YourFeatureName`
7. **Create Pull Request** with detailed description

## Coding Standards

### Batch Script Guidelines

```batch
:: Use clear comments
:: Explain complex operations

:: Use consistent indentation
if %choice%==1 (
    echo Processing...
    :: Your code here
)

:: Handle errors gracefully
if %errorlevel% neq 0 (
    echo Error occurred!
    goto :ERROR_HANDLER
)

:: Use meaningful variable names
set networkAdapterName=Ethernet
```

### ASCII Art Guidelines

- Keep ASCII art simple and readable
- Ensure it displays correctly in standard CMD window (80 columns)
- Test on different console configurations

### Testing

Before submitting:

1. Test on clean Windows installations
2. Test with and without admin rights
3. Verify all menu options work
4. Check for typos and grammar
5. Ensure proper error handling

## Project Structure

```
windows-repair-tools/
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── tools/
│   ├── network-repair-tool.bat
│   ├── system-file-repair-tool.bat
│   └── [other-tools].bat
├── docs/
│   ├── usage-guide.md
│   └── troubleshooting.md
└── assets/
    └── screenshots/
```

## Questions?

Feel free to open an issue with the "question" label if you need clarification on anything.

Thank you for contributing! 🎉
