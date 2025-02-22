# Conda Channel Configuration

## Channel Management

### View Current Channels
```bash
conda config --show channels
```

### Add Channels
```bash
# Add a new channel
conda config --add channels conda-forge

# Add channel with highest priority
conda config --prepend channels bioconda
```

### Remove Channels
```bash
conda config --remove channels channel_name
```

## Channel Priority

### Set Channel Priority
```bash
# Set strict channel priority
conda config --set channel_priority strict

# Set flexible channel priority
conda config --set channel_priority flexible
```

### Channel Order Configuration
```bash
# List channels in order of priority
conda config --describe channel_priority

# Set default channels
conda config --set default_channels ["main","r"]
```

## Custom Channel Settings

### Configure SSL Verification
```bash
conda config --set ssl_verify false
```

### Set Channel Authentication
```bash
conda config --set custom_channels.mychannel https://conda.mychannel.com/
```

## Advanced Channel Options

### Channel Aliases
```bash
conda config --add channel_alias https://custom.channel.url/
```

### Offline Mode
```bash
conda config --set offline true
```

### Show Channel URLs
```bash
conda config --show-sources
```

## Best Practices

### Configure Multiple Channels
```bash
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
```

### Reset Channel Configuration
```bash
conda config --remove-key channels
```