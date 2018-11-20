Received: from mail-eopbgr720107.outbound.protection.outlook.com ([40.107.72.107]:17691
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990509AbeKTWAfFpCI2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Nov 2018 23:00:35 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Enable Undefined Behavior Sanitizer UBSAN
Date: Tue, 20 Nov 2018 22:00:32 +0000
Message-ID: <MWHPR2201MB1277AFC56E3D87C3B685B566C1D90@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181120004937.8211-1-hassan.naveed@mips.com>
In-Reply-To: <20181120004937.8211-1-hassan.naveed@mips.com>
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
To: Hassan Naveed <hnaveed@wavecomp.com>Hassan Naveed <hnaveed@wavecomp.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181120220032.qJfPD7x65SKtCEbMxZ7Nh-8slylCebD0FPe_DK9BZzY@z>

Hello,

Hassan Naveed Hassan Naveed wrote:
> From: Hassan Naveed <hnaveed@wavecomp.com>
> 
> Select ARCH_HAS_UBSAN_SANITIZE_ALL in order to allow the user to
> enable CONFIG_UBSAN_SANITIZE_ALL and instrument the entire kernel for
> ubsan checks.
> We exclude the VDSO from this because its build doesn't include the
> __ubsan_handle_*() functions that the kernel proper defines in from
> lib/ubsan.c, and the VDSO would have no sane way to report errors even
> if it had definitions of these functions.
> 
> Signed-off-by: Hassan Naveed <hnaveed@wavecomp.com>
> Reviewed-by: Paul Burton <paul.burton@mips.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
