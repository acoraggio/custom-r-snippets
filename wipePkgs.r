# Subset only packages
Loaded2 <- subset(search(), grepl(pattern = 'package:', search()))
# Extract only user-loaded packages
Loaded3 <- regmatches(Loaded2, regexpr('package:stats$|package:graphics$|package:grDevices$|package:utils$|package:datasets$|package:methods$|package:base$', Loaded2), invert = TRUE)
# Clean up zero length vectors
Loaded4 <- subset(Loaded3, grepl(pattern = 'package:', Loaded3))
# Save packages for later loading
savedPkgs <- gsub(pattern = 'package:', replacement = '', Loaded4)

# Detach all non-base packages as lapply
lapply(Loaded4, detach, character.only = TRUE)

# Clean up environment
rm(Loaded2)
rm(Loaded3)
rm(Loaded4)