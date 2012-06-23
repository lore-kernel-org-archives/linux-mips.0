Received: from [69.28.251.93] ([69.28.251.93]:53253 "EHLO b32.net"
        rhost-flags-FAIL-FAIL-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1901171Ab2FWFXn (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 23 Jun 2012 07:23:43 +0200
From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH 0/7] Prerequisites for BCM63XX UDC driver
Date: Fri, 22 Jun 2012 22:14:50 -0700
Message-ID: <0f67eabbb0d5c59add27e42a08b94944@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.org
Cc: ffainelli@freebox.fr, mbizon@freebox.fr, jonas.gorski@gmail.com, linux-mips@linux-mips.org
Message-ID: <20120623051450.Y_G4zIAZgp3upOg2uUqqJXRlxumsOZQhyu9dZ--FxFc@z>

These patches are intended to lay the groundwork for a new USB Device
Controller (gadget UDC) driver.  arch/mips/bcm63xx updates include:

Clock enable bits
DMA descriptor updates
New register and IRQ definitions
Create platform_device and platform_data

Baseline is:

git://git.linux-mips.org/pub/scm/ralf/upstream-sfr.git #mips-for-linux-next

Note that this is not an OTG-capable controller.  Therefore, boards are
permanently wired up for either host mode or device mode.  Device vs.
host can be determined in board_bcm963xx.c based on the detected board ID.
Some boards have connectors/pads for both modes, but need to be
reworked to run in device mode; usually this involves moving 0-ohm
resistors on the D+ and D- lines.
