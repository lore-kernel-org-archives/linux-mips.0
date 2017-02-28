Received: from mailapp01.imgtec.com ([195.59.15.196]:64025 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993177AbdB1WEcFmHmJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Feb 2017 23:04:32 +0100
Date: Tue, 28 Feb 2017 22:04:10 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 2/4] MIPS: microMIPS: Fix decoding of addiusp
 instruction
In-Reply-To: <1488296279-23057-3-git-send-email-matt.redfearn@imgtec.com>
Message-ID: <alpine.DEB.2.00.1702282153030.26999@tp.orcam.me.uk>
References: <1488296279-23057-1-git-send-email-matt.redfearn@imgtec.com> <1488296279-23057-3-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170228220410.O-swhelVv_esz5mNgqp2jPdkPXFlENcLgo7lcx2oli8@z>

On Tue, 28 Feb 2017, Matt Redfearn wrote:

> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index 5b1e932ae973..6ba5b775579c 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -386,8 +386,9 @@ static int get_frame_info(struct mips_frame_info *info)
>  
>  					if (ip->halfword[0] & mm_addiusp_func)
>  					{
> -						tmp = (((ip->halfword[0] >> 1) & 0x1ff) << 2);
> -						info->frame_size = -(signed short)(tmp | ((tmp & 0x100) ? 0xfe00 : 0));
> +						tmp = (ip->halfword[0] >> 1) & 0x1ff;
> +						tmp = tmp | ((tmp & 0x100) ? 0xfe00 : 0);
> +						info->frame_size = -(signed short)(tmp << 2);

 Ugh, this is unreadable -- can you please figure out a way to fit it in 
79 columns?  Perhaps by factoring this piece out?

 Also this:

	tmp = (ip->halfword[0] >> 1) & 0x1ff;
	tmp = tmp | ((tmp & 0x100) ? 0xfe00 : 0);

will likely result in better code without the conditional, e.g.:

	tmp = (((ip->halfword[0] >> 1) & 0x1ff) ^ 0x100) - 0x100;

(the usual way to sign-extend).

  Maciej
