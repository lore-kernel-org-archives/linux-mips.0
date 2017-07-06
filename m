Received: from mail-wr0-x244.google.com ([IPv6:2a00:1450:400c:c0c::244]:33040
        "EHLO mail-wr0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993939AbdGFWZBV9Xw7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Jul 2017 00:25:01 +0200
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v3 0/4] Broadcom STB S2/S3/S5 support for ARM and MIPS
Date: Thu,  6 Jul 2017 15:22:21 -0700
Message-ID: <20170706222225.9758-1-f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, Justin Chen <justinpopo6@gmail.com>, Doug Berger <opendmb@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM BCM47XX MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, linux-pm@vger.kernerl.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Message-ID: <20170706222221.RKx4HZqJ2aRBBTQR4Iw9B5dBnStplA4W3yxOMH5Sj9o@z>

Hi,

This patch series adds support for S2/S3/S5 suspend/resume states on
ARM and MIPS based Broadcom STB SoCs.

This was submitted a long time ago by Brian, and I am now picking this
up and trying to get this included with support for our latest chips.

Provided that I can collect the necessary Acks from Rob (DT) and other
people (Rafael?) I would probably take this via the Broadcom ARM SoC
pull requests.

Thank you!

Changes in v3:

- make SRAM mapping uncached
- make SWAP_STACK + brcmstb_pm_s3_finish a single asm volatile statement
- added Rob's Acked-by to first patch

Changes in v2:

- clarify the first patch's subject (Rob)
- removed patch #2 which was creating a bisectability problem (kbuild)
- added proper AFLAGS to get s2-arm.S to build properly (kbuild)
- improved MIPS power management binding document (Rob)

Brian Norris (1):
  soc: bcm: brcmstb: Add support for S2/S3/S5 suspend states (ARM)

Florian Fainelli (2):
  dt-bindings: ARM: brcmstb: Update Broadcom STB Power Management
    binding
  dt-bindings: Document MIPS Broadcom STB power management nodes

Justin Chen (1):
  soc bcm: brcmstb: Add support for S2/S3/S5 suspend states (MIPS)

 .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt   |   6 +-
 .../devicetree/bindings/mips/brcm/soc.txt          | 153 ++++
 drivers/soc/bcm/Kconfig                            |   2 +
 drivers/soc/bcm/brcmstb/Kconfig                    |   9 +
 drivers/soc/bcm/brcmstb/Makefile                   |   1 +
 drivers/soc/bcm/brcmstb/pm/Makefile                |   3 +
 drivers/soc/bcm/brcmstb/pm/aon_defs.h              | 113 +++
 drivers/soc/bcm/brcmstb/pm/pm-arm.c                | 836 +++++++++++++++++++++
 drivers/soc/bcm/brcmstb/pm/pm-mips.c               | 461 ++++++++++++
 drivers/soc/bcm/brcmstb/pm/pm.h                    |  89 +++
 drivers/soc/bcm/brcmstb/pm/s2-arm.S                |  76 ++
 drivers/soc/bcm/brcmstb/pm/s2-mips.S               | 200 +++++
 drivers/soc/bcm/brcmstb/pm/s3-mips.S               | 146 ++++
 13 files changed, 2094 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/bcm/brcmstb/Kconfig
 create mode 100644 drivers/soc/bcm/brcmstb/pm/Makefile
 create mode 100644 drivers/soc/bcm/brcmstb/pm/aon_defs.h
 create mode 100644 drivers/soc/bcm/brcmstb/pm/pm-arm.c
 create mode 100644 drivers/soc/bcm/brcmstb/pm/pm-mips.c
 create mode 100644 drivers/soc/bcm/brcmstb/pm/pm.h
 create mode 100644 drivers/soc/bcm/brcmstb/pm/s2-arm.S
 create mode 100644 drivers/soc/bcm/brcmstb/pm/s2-mips.S
 create mode 100644 drivers/soc/bcm/brcmstb/pm/s3-mips.S

-- 
2.9.3
