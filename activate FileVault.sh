#!/bin/sh
# Author: @iddicted
activate_FileVault(){
    sudo fdesetup enable
    sudo jamf recon
}
activate_FileVault