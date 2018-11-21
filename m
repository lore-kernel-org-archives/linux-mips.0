Received: from mail-eopbgr810104.outbound.protection.outlook.com ([40.107.81.104]:37657
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993889AbeKUTXarCoii convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Nov 2018 20:23:30 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] mips: fix mips_get_syscall_arg o32 check
Date: Wed, 21 Nov 2018 19:23:28 +0000
Message-ID: <MWHPR2201MB1277D0B64034597F9714C089C1DA0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181121191438.GB10301@altlinux.org>
In-Reply-To: <20181121191438.GB10301@altlinux.org>
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
To: "Dmitry V. Levin" <ldv@altlinux.org>
Cc: Paul Burton <pburton@wavecomp.com>, Elvira Khabirova <lineprinter@altlinux.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181121192328.UqFzYF7O_0h9HjtqEc01HhJgGft36NGcwPlXGKA76EE@z>

Hello,

Dmitry V. Levin wrote:
> When checking for TIF_32BIT_REGS flag, mips_get_syscall_arg() should
> use the task specified as its argument instead of the current task.
> 
> This potentially affects all syscall_get_arguments() users
> who specify tasks different from the current.
> 
> Fixes: c0ff3c53d4f99 ("MIPS: Enable HAVE_ARCH_TRACEHOOK.")
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
