Message-ID: <3EE4C5CF.3050607@galileo.co.il>
Date: Mon, 09 Jun 2003 19:37:19 +0200
From: Baruch Chaikin <bchaikin@il.marvell.com>
MIME-Version: 1.0
Subject: Building a stand-alone FS on a very limited flash (newbie  question)
References: <Pine.GSO.4.44.0306061234410.4045-100000@hydra.mmc.atmel.com> <Pine.GSO.3.96.1030609164009.2806n-100000@delta.ds2.pg.gda.pl> <20030609154408.GA1781@nevyn.them.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <bchaikin@galileo.co.il>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: linux-mips@linux-mips.org, Rabeeh Khoury <rabeeh@galileo.co.il>, Baruch Chaikin <bchaikin@galileo.co.il>
Message-ID: <20030609173719.BcFtRz5qBDSMhjxc18c4qPBh2zQtK0rfEi7yp-MLJNs@z>

Hi all,

I'm using MIPS kernel 2.4.18 with NFS file system mounted on a RedHat 
machine. This works fine, but is unsuitable for system deployment. Do 
you have hints for me where to start, in order to put the file system on 
flash? The platform I'm using is very limited - only one MTD block of 
2.5 MB is available for the file system, out of a 4 MB flash:
    0.5 MB is allocated for the firmware code
    1.0 MB for the compressed kernel image
    2.5 MB for the (compressed?) file system

For example, I've noticed LibC itself is ~5 MB !

Thanks for any tip,
-    Baruch.
