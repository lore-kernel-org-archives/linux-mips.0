Received: from mail-eopbgr760101.outbound.protection.outlook.com ([40.107.76.101]:43904
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993840AbeKUXnFDPd6q convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Nov 2018 00:43:05 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 00/24] MIPS: OCTEON: cleanups
Date: Wed, 21 Nov 2018 23:43:01 +0000
Message-ID: <MWHPR2201MB1277E4440F24D85DDA79E497C1DA0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181121223745.22792-1-aaro.koskinen@iki.fi>
In-Reply-To: <20181121223745.22792-1-aaro.koskinen@iki.fi>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, James Hogan <jhogan@kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181121234301.K2zmpJgAHJynaCd4RVLG8Rzwt_FLW--3OxR0XF9KBNk@z>

Hello,

Aaro Koskinen wrote:
> Hi,
> 
> I noticed some noise from "sparse" when compiling OCTEON platform code,
> and started to fix some of the most obvious issues (e.g. adding includes
> for missing function declarations, using static where appropriate
> etc.). Then I also got around to deleting some of the dead code.
> We have some insanely large include files, and two of the biggest ones
> should be now closer to normal..
> 
> Boot tested on OCTEON+ (EdgeRouter Lite) and OCTEON 2 (EdgeRouter Pro).
> 
> Build tested with cavium_octeon_defconfig.
> 
> A.
> 
> Aaro Koskinen (24):
> MIPS: OCTEON: cvmx-l2c: make cvmx_l2c_spinlock static
> MIPS: OCTEON: setup: make internal functions and data static
> MIPS: OCTEON: setup: include asm/fw/fw.h
> MIPS: OCTEON: setup: include asm/prom.h
> MIPS: OCTEON: cvmx-helper: make
> __cvmx_helper_errata_fix_ipd_ptr_alignment static
> MIPS: OCTEON: delete unused loopback configuration functions
> MIPS: OCTEON: octeon-platform: make octeon_ids static
> MIPS: OCTEON: octeon-platform: fix typing
> MIPS: OCTEON: octeon-irq: make octeon_irq_ciu3_set_affinity() static
> MIPS: OCTEON: csrc-octeon: include linux/sched/clock.h
> MIPS: OCTEON: smp: make internal symbols static
> MIPS: OCTEON: cvmx-helper-util: delete cvmx_helper_dump_packet
> MIPS: OCTEON: cvmx-helper-util: make cvmx_helper_setup_red_queue
> static
> MIPS: OCTEON: make cvmx_bootmem_alloc_range static
> MIPS: OCTEON: cvmx-bootmem: delete unused functions
> MIPS: OCTEON: cvmx-bootmem: move code to avoid forward declarations
> MIPS: OCTEON: cvmx-bootmem: make more functions static
> MIPS: OCTEON: delete cvmx override functions
> MIPS: OCTEON: gmxx-defs.h: delete unused functions and macros
> MIPS: OCTEON: cvmx-gmxx-defs.h: delete unused unions
> MIPS: OCTEON: cvmx-gmxx-defs.h: delete unused union fields
> MIPS: OCTEON: cvmx-gmxx-defs.h: use default register value return when
> possible
> MIPS: OCTEON: cvmx-ciu2-defs.h: delete unused macros
> MIPS: OCTEON: cvmx-ciu2-defs.h: delete unused unions
> 
> arch/mips/cavium-octeon/csrc-octeon.c         |    1 +
> .../cavium-octeon/executive/cvmx-bootmem.c    |  149 +-
> .../executive/cvmx-helper-rgmii.c             |   68 -
> .../executive/cvmx-helper-sgmii.c             |   38 -
> .../executive/cvmx-helper-util.c              |   90 +-
> .../executive/cvmx-helper-xaui.c              |   39 -
> .../cavium-octeon/executive/cvmx-helper.c     |   87 +-
> arch/mips/cavium-octeon/executive/cvmx-l2c.c  |    2 +-
> arch/mips/cavium-octeon/octeon-irq.c          |    4 +-
> arch/mips/cavium-octeon/octeon-platform.c     |    4 +-
> arch/mips/cavium-octeon/setup.c               |    8 +-
> arch/mips/cavium-octeon/smp.c                 |    4 +-
> arch/mips/include/asm/octeon/cvmx-bootmem.h   |   76 -
> arch/mips/include/asm/octeon/cvmx-ciu2-defs.h | 7060 -----------------
> arch/mips/include/asm/octeon/cvmx-gmxx-defs.h | 4940 +-----------
> .../include/asm/octeon/cvmx-helper-rgmii.h    |   17 -
> .../include/asm/octeon/cvmx-helper-sgmii.h    |   17 -
> .../include/asm/octeon/cvmx-helper-util.h     |   23 -
> .../include/asm/octeon/cvmx-helper-xaui.h     |   16 -
> arch/mips/include/asm/octeon/cvmx-helper.h    |   36 -
> 20 files changed, 295 insertions(+), 12384 deletions(-)

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
