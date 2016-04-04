Received: from mailapp01.imgtec.com ([195.59.15.196]:57721 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27024739AbcDDIHB0G4K3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 4 Apr 2016 10:07:01 +0200
Date: Mon, 4 Apr 2016 09:06:54 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH] MIPS: Fix broken malta qemu
Message-ID: <20160404080654.GA14758@NP-P-BURTON>
References: <1458248889-24663-1-git-send-email-qsyousef@gmail.com>
 <20160401124852.GA5145@NP-P-BURTON>
 <56FFB8B7.8050607@gmail.com>
 <20160404064140.GA1368@NP-P-BURTON>
 <20160404080222.GA15222@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20160404080222.GA15222@linux-mips.org>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Qais Yousef <qsyousef@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20160404080654.4p0fB2dPu2RmICjX_bj3EH3w5kcM0-wk5KZqN_9JWyQ@z>

On Mon, Apr 04, 2016 at 10:02:23AM +0200, Ralf Baechle wrote:
> FYI, Qais' initial fix is in the pull request I sent to Linus yesterday so
> any fixes please relative to that patch.

Hi Ralf,

To late - I already submitted:

    https://patchwork.linux-mips.org/patch/13003/

I can rebase, but it'll be a revert of Qais' workaround followed by
mine & squashed.

Thanks,
    Paul
