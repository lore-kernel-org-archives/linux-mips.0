Reply-To: <peter@milleson.com>
From: "Peter Milleson" <peter@milleson.com>
Subject: boots then kernel panic
Date: Wed, 11 Jul 2001 14:17:14 -0500
Message-ID: <MEEBIKPBEIOBCILMHHEJOEMDCCAA.peter@milleson.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010711191714.ZztYTzknmKrinP5xo7rw60Ihndjk2Jfo09i2Ijo4a6Y@z>

Hi all!

Finally have my bootp and tftp server working in order for my used Indy 175
to boot off the network. The system finally downloaded the kernel image (the
kernel from hardhat-sgi-5.1) and the system kernel panics with the following
error:

SCSI bus is being reset for host 0 channel 0.
scsi0: reset. page fault from irq handler: 0000
$0 : {lots of numbers}
$4 : "	"
$8 : "	"
$12: "	"
$16: "	"
$29: "	"
$24: "	"
$28: "	"
epc	: 880fa97c
Status: 1004fc82
Cause	: 000000008
Aiee, killing interrupt handler
Kernel panic: Attempted to kill the idle task!
In swapper task - not syncing

Could there be a problem with the onboard SCSI controller? I don't know of
any way to test the SCSI subsystem without a bootable SGI cdrom. I am going
to try and download a different (newer?) kernel and try again and see what
happens.

Any help or pointers in the right direction would greatly be appreciated.

Thanks,

Peter
mailto:pitr256@milleson.com
