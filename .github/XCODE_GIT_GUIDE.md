# Using Git with Xcode

This guide will help you use git directly from Xcode for the Mexico Tax Calculator project.

## ✅ Initial Setup (Already Done!)

Your project is already connected to git with these settings:
- **Repository**: https://github.com/edgarfc/MexicoTaxCalculator-iPad.git
- **Author**: Edgar Flores <edgar.afc@gmail.com>
- **Branch**: main

## 🔍 Verify Git Connection in Xcode

1. **Open Xcode** (should already be open)
2. **Check Source Control Status**:
   - Menu Bar → **Source Control** → **Pull** (to verify connection)
   - If you see your remote repository, you're connected! ✅

3. **View Source Control Navigator**:
   - Press `⌘ + 2` (Command + 2)
   - Or: View → Navigators → Source Control Navigator
   - You should see your repository and branches

## 📝 Making Changes and Committing

### Option 1: Using Xcode Source Control Menu

1. **Make your code changes** in Xcode
2. **View changed files**:
   - Source Control Navigator (`⌘ + 2`)
   - Changed files appear with "M" (Modified) or "A" (Added) markers

3. **Commit changes**:
   - Menu: **Source Control** → **Commit...**
   - Or press: `⌘ + Option + C`
   - Review your changes
   - **Write commit message** (IMPORTANT: Update CHANGELOG.md first!)
   - Check "Push to remote" if you want to push immediately
   - Click **Commit** (or **Commit and Push**)

### Option 2: Using Xcode Source Control Panel

1. **Open Source Control Changes**:
   - Click the **Source Control** icon in the toolbar (looks like a branch)
   - Or press `⌃ + 0` (Control + 0), then click "Changes"

2. **Stage files**:
   - Select files you want to commit
   - Right-click → **Stage Selected**

3. **Commit**:
   - Enter commit message
   - Click **Commit** button

## 🔄 Common Git Operations in Xcode

### Pull (Get latest changes from GitHub)
- **Menu**: Source Control → Pull
- **Keyboard**: `⌘ + Option + X`

### Push (Upload your commits to GitHub)
- **Menu**: Source Control → Push
- **Keyboard**: `⌘ + Option + P`

### Create a Branch
- **Menu**: Source Control → New Branch...
- Enter branch name (e.g., `feature/dark-mode`)
- Click **Create**

### Switch Branches
- **Menu**: Source Control → Switch to Branch...
- Select branch
- Click **Switch**

### View File History
- **Select a file** in Project Navigator
- **Menu**: Source Control → History...
- Or right-click file → **Show Source Control History**

### Compare Changes
- **Select a file** with changes
- **Menu**: Source Control → Commit...
- Click the file to see diff (left = old, right = new)

## 📋 Recommended Workflow

### Before Making Changes
1. **Pull latest changes**: `⌘ + Option + X`
2. Make sure you're on the right branch

### While Coding
1. **Make your changes** in Xcode
2. **Test your changes** in simulator
3. **Update CHANGELOG.md** (required!)
   - Open CHANGELOG.md in Xcode
   - Add entry under `[Unreleased]` section

### Committing
1. **Review changes**: Source Control → Commit (`⌘ + Option + C`)
2. **Write descriptive commit message**:
   ```
   Brief description of change

   - Detailed point 1
   - Detailed point 2
   - Updated CHANGELOG.md
   ```
3. **Check "Push to remote"** if ready to upload
4. **Click Commit and Push**

### Example Commit Message
```
Fix button alignment on iPhone SE

- Changed fixed width constraints to flexible layout
- Updated padding for smaller screens
- Tested on iPhone SE, 14, and 15 Pro Max
- Updated CHANGELOG.md with fix details
```

## 🎯 Quick Tips

### View Changes While Editing
- **Enable comparison view**:
  - Editor → Change Editor Orientation → Side by Side
  - Editor → Show Authors/Changes
- You'll see inline indicators of your changes

### Discard Changes
- **Single file**: Right-click → Discard Changes
- **All files**: Source Control → Discard All Changes...
- ⚠️ This permanently removes your changes!

### Resolve Conflicts
If you get conflicts when pulling:
1. Xcode will highlight conflicted files
2. Click the file → View → Show Version Editor → Comparison
3. Choose which changes to keep
4. Click **Mark Resolved**
5. Commit the merge

## 🚨 Important Reminders

### Always Update CHANGELOG.md
Before committing code changes:
1. Open `CHANGELOG.md`
2. Add entry under `[Unreleased]`
3. Include: what changed, why, which files, user impact
4. Stage CHANGELOG.md along with your code changes

### Don't Commit Sensitive Data
These are already in `.gitignore`:
- `xcuserdata/` (user-specific Xcode settings)
- Build artifacts
- `.DS_Store` files
- Personal API keys or credentials

### Test Before Committing
1. Build the project (`⌘ + B`)
2. Run on iPhone simulator
3. Run on iPad simulator
4. Test the specific feature you changed

## 🔧 Xcode Git Preferences

### Configure Xcode Git Settings
1. **Xcode** → **Settings** (or **Preferences**)
2. Go to **Source Control** tab
3. Recommended settings:
   - ✅ Enable source control
   - ✅ Refresh local status automatically
   - ✅ Fetch and refresh server status automatically
   - ✅ Add and remove files automatically
   - ✅ Show source control changes

### Set Author Info (Already configured!)
1. **Xcode** → **Settings** → **Source Control**
2. Click **Git** section
3. Verify:
   - Author Name: Edgar Flores
   - Author Email: edgar.afc@gmail.com

## 📱 Xcode Source Control Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Commit | `⌘ + Option + C` |
| Pull | `⌘ + Option + X` |
| Push | `⌘ + Option + P` |
| Source Control Navigator | `⌘ + 2` |
| Show Changes Panel | `⌃ + 0` then select Changes |
| Discard Changes | (No default, use menu) |

## 🐛 Troubleshooting

### "Authentication Failed" Error
If you can't push from Xcode:
1. **Option A**: Use Terminal
   ```bash
   cd /Users/eaflores/claude-sandbox/MexicoTaxCalculator-ipad
   git push origin main
   ```
   (GitHub CLI authentication will handle it)

2. **Option B**: Add Personal Access Token
   - Generate token at: https://github.com/settings/tokens
   - In Xcode: Settings → Accounts → Add GitHub account
   - Use token as password

### "Please commit your changes or stash them"
You have uncommitted changes:
1. Commit them: `⌘ + Option + C`
2. Or discard: Source Control → Discard All Changes

### Can't See Git History
1. Make sure you're viewing the right file
2. Try closing and reopening the project
3. Verify git connection: Source Control → Pull

## 📚 Additional Resources

- [Xcode Source Control Documentation](https://developer.apple.com/documentation/xcode/source-control-management)
- [Git Basics](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)
- Project CHANGELOG: [CHANGELOG.md](../CHANGELOG.md)
- Contributing Guide: [CONTRIBUTING.md](CONTRIBUTING.md)

## ✅ Quick Checklist for Each Commit

- [ ] Code changes complete and tested
- [ ] Tested on iPhone simulator
- [ ] Tested on iPad simulator
- [ ] CHANGELOG.md updated
- [ ] Descriptive commit message written
- [ ] No sensitive data being committed
- [ ] Build succeeds (`⌘ + B`)

---

**Remember**: Every code change should have a corresponding CHANGELOG.md entry! 📝
