content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: How to add more memory?
Date: Wed, 21 Jan 2004 15:58:24 -0600
Message-ID: <CFD808D1D39ACB47ABFF586D484CC52EADE212@hqmailnode1.commstor.crossroads.com>
From: "Nils Larson" <nlarson@Crossroads.com>
Return-Path: <nlarson@Crossroads.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040121215824.0R3-P-tVMt7WKObrAloilg5Xgas1aARKs59y0NmZTek@z>

Hi,
We currently have a mips platform running Linux with 256MB of
RAM starting at 0x8000_0000. We would like to add an additional
1GB of RAM, maybe starting at 0x4000_0000, that would be used
for user apps (user virtual memory). The memory map is:
0x8000_0000 - 256MB RAM
0xA000_0000 - uncached version of the same 256MB
0xB000_0000 - PCI memory windows.
This is a diskless setup booting from a ramdisk.
So, the (sort of newbie) questions are:
1. How do we tell Linux to use the new memory?
2. Is this feasible?
3. Is there a better way to add more memory?
We need more space for user data.
Thanks,
Nils
