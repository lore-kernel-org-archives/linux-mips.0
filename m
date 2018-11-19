Received: from mail-eopbgr790137.outbound.protection.outlook.com ([40.107.79.137]:54432
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991346AbeKSTGay2qJv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 19 Nov 2018 20:06:30 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Loongson3,SGI-IP27: Simplify max_low_pfn
 calculation
Date: Mon, 19 Nov 2018 19:06:27 +0000
Message-ID: <MWHPR2201MB12771953A7F479D5670BD8E6C1D80@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181112221742.4900-1-paul.burton@mips.com>
In-Reply-To: <20181112221742.4900-1-paul.burton@mips.com>
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
To: Paul Burton <pburton@wavecomp.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Huacai Chen <chenhc@lemote.com>, Mike Rapoport <rppt@linux.ibm.com>, Thomas Bogendoerfer <tbogendoerfer@suse.de>Huacai Chen <chenhc@lemote.com>Mike Rapoport <rppt@linux.ibm.com>Thomas Bogendoerfer <tbogendoerfer@suse.de>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181119190627.1M0_BdKEU6jEHaxuZlpADZ9IgB2DXuV5K0eKovqGPxc@z>

Hello,

Paul Burton wrote:
> Both the Loongson3 & SGI-IP27 platforms set max_low_pfn to the last
> available PFN describing memory. They both do it in paging_init() which
> is later than ideal since max_low_pfn is used before that function is
> called. Simplify both platforms to trivially initialize max_low_pfn
> using the end address of DRAM, and do it earlier in prom_meminit().
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Suggested-by: Mike Rapoport <rppt@linux.ibm.com>
> References: https://patchwork.linux-mips.org/patch/21031/
> Cc: Huacai Chen <chenhc@lemote.com>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Tested-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
