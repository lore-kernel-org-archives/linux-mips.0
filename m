Received: from mail-eopbgr770108.outbound.protection.outlook.com ([40.107.77.108]:6166
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993149AbeKMWW2xwiHu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:22:28 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Boston: Disable EG20T prefetch
Date: Tue, 13 Nov 2018 22:22:26 +0000
Message-ID: <CY4PR2201MB1272FABB3DDAFDAF3E3800E8C1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20181110001155.12786-1-paul.burton@mips.com>
In-Reply-To: <20181110001155.12786-1-paul.burton@mips.com>
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
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181113222226.B9CvobRX2mZZOHjrmbKwy5ok2YClgCrQdVo0DIFx9bE@z>

Hello,

Paul Burton wrote:
> The Intel EG20T Platform Controller Hub used on the MIPS Boston
> development board supports prefetching memory to optimize DMA transfers.
> Unfortunately for unknown reasons this doesn't work well with some MIPS
> CPUs such as the P6600, particularly when using an I/O Coherence Unit
> (IOCU) to provide cache-coherent DMA. In these systems it is common for
> DMA data to be lost, resulting in broken access to EG20T devices such as
> the MMC or SATA controllers.
> 
> Support for a DT property to configure the prefetching was added a while
> back by commit 549ce8f134bd ("misc: pch_phub: Read prefetch value from
> device tree if passed") but we never added the DT snippet to make use of
> it. Add that now in order to disable the prefetching & fix DMA on the
> affected systems.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
