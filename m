Received: from mail-bl2on0062.outbound.protection.outlook.com ([65.55.169.62]:48969
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012480AbbHMTRSw6ckD (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 13 Aug 2015 21:17:18 +0200
Message-ID: <55CCED1B.6030701@caviumnetworks.com>
Date: Thu, 13 Aug 2015 12:16:43 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 00/14] MIPS/staging: OCTEON: enable ethernet/xaui on CN68XX
References: <1439472106-7750-1-git-send-email-aaro.koskinen@nokia.com>
In-Reply-To: <1439472106-7750-1-git-send-email-aaro.koskinen@nokia.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@nokia.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Janne Huttunen <janne.huttunen@nokia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Message-ID: <20150813191643.CIyMCBJNpSqsJxa4hAtKQj0ocCs2AIknzibftELfWeE@z>

On 08/13/2015 06:21 AM, Aaro Koskinen wrote:
> Hi,
>
> Currently mainline Linux is unusable on OCTEON II CN68XX SOCs due to
> issues in Ethernet driver initialization. Some boards are hanging during
> init, and all the needed register differences compared to the older SOCs
> are not taken into account to make interrupts and packet delivery to work.
>
> This patch set provides a minimal support to get octeon-ethernet going
> on CN68XX. Tested on top of 4.2-rc6 with Cavium EBB6800 and Kontron
> S1901 boards by sending traffic over XAUI interface with busybox.

You don't say how it was tested.

Does OCTEON and OCTEON II networking continue to function?

There is no SSO provisioning, so there will be limited buffering on 
packet ingress.  For low packet rates, it should be fine though.

David Daney


>
> A.
>
> Aaro Koskinen (2):
>    MIPS/staging: OCTEON: properly enable/disable SSO WQE interrupts
>    MIPS/staging: OCTEON: set SSO group mask properly on CN68XX
>
> Janne Huttunen (12):
>    MIPS: OCTEON: fix CN6880 hang on XAUI init
>    MIPS: OCTEON: support additional interfaces on CN68XX
>    MIPS: OCTEON: support all PIP input ports on CN68XX
>    MIPS: OCTEON: configure XAUI pkinds
>    MIPS: OCTEON: configure minimum PKO packet sizes on CN68XX
>    MIPS: OCTEON: add definitions for setting up SSO
>    MIPS/staging: OCTEON: increase output command buffers
>    MIPS/staging: OCTEON: support CN68XX style WQE
>    MIPS: OCTEON: initialize CN68XX PKO
>    MIPS: OCTEON: set up 1:1 mapping between CN68XX PKO queues and ports
>    MIPS: OCTEON: support interfaces 4 and 5
>    MIPS/staging: OCTEON: use common helpers for determining interface and
>      port
>
>   .../cavium-octeon/executive/cvmx-helper-util.c     |  20 +-
>   .../cavium-octeon/executive/cvmx-helper-xaui.c     |  14 +-
>   arch/mips/cavium-octeon/executive/cvmx-helper.c    |  17 ++
>   arch/mips/cavium-octeon/executive/cvmx-pko.c       | 149 +++++++++-
>   arch/mips/include/asm/octeon/cvmx-pip.h            |   2 +-
>   arch/mips/include/asm/octeon/cvmx-pko.h            |   3 +
>   arch/mips/include/asm/octeon/cvmx-pow-defs.h       |  29 ++
>   arch/mips/include/asm/octeon/cvmx-pow.h            |   9 +-
>   arch/mips/include/asm/octeon/cvmx-wqe.h            | 308 +++++++++++++++++----
>   drivers/staging/octeon/ethernet-rx.c               | 133 ++++++---
>   drivers/staging/octeon/ethernet-tx.c               |  19 +-
>   drivers/staging/octeon/ethernet-util.h             |  22 +-
>   drivers/staging/octeon/ethernet.c                  |   7 +-
>   13 files changed, 595 insertions(+), 137 deletions(-)
>
