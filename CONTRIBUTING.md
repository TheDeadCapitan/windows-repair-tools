# Contributing to Windows Repair Tools

First off, thank you for considering contributing to Windows Repair Tools! 

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates.

**How to submit a good bug report:**

1. Use a clear and descriptive title
2. Include your Windows version (Win+Pause to check)
3. Describe the exact steps to reproduce the problem
4. Include any error messages
5. Explain what you expected to happen

### Suggesting Enhancements

Enhancement suggestions are welcome! Please:

1. Use a clear and descriptive title
2. Provide a detailed description of the proposed feature
3. Explain why this enhancement would be useful
4. Include mockups or examples if applicable

### Pull Requests

1. Fork the repo and create your branch from `main`
2. Make your changes
3. Test on multiple Windows versions if possible
4. Update documentation if needed
5. Submit the pull request

## Development Guidelines

### Batch Script Standards

1. **Use clear variable names**
   ```batch
   REM Good
   set network_status=connected
   
   REM Bad
   set ns=c
   ```

2. **Add comments for complex operations**
   ```batch
   REM Reset network adapter to clear corrupted settings
   netsh winsock reset
   ```

3. **Include error handling**
   ```batch
   ipconfig /renew
   if %errorlevel% neq 0 (
       echo [!] Failed to renew IP address
   )
   ```

4. **Use consistent formatting**
   - Indent with 4 spaces
   - Use UPPERCASE for labels
   - Keep lines under 80 characters when possible

### ASCII Art Guidelines

Keep ASCII art simple and readable:
```
REM Good - Clear and simple
echo    [o_o]
echo     -!-
echo     / \

REM Avoid - Too complex
echo   ╔═══════════╗
echo   ║ ┌─┐ ┌─┐  ║
echo   ║ │ │ │ │  ║
```

### Testing

Before submitting:

1. Test on Windows 10/11 (minimum)
2. Run as both admin and non-admin
3. Test all menu options
4. Verify error messages display correctly
5. Check that the tool exits cleanly

## Code of Conduct

- Be respectful and inclusive
- Welcome newcomers and help them
- Focus on constructive criticism
- No harassment or offensive language

## Questions?

Feel free to open an issue with the "question" label!

---

Thank you for helping make Windows Repair Tools better! 🎉
