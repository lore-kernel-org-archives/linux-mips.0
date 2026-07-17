Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED6A3EAC8F;
	Fri, 17 Jul 2026 11:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286316; cv=none; b=gU/k5vAFOa/4eKOb4IUbUcXfn5ruKP9gi76v5Khqcw/ZugHpZelFhIHidjxDFt6ytT/8xw/ZQ/DqxPPGeluenJ4IlE7vzRnz5E7ARaFTqs1pEEF8orFlzPDo1UvCBvQ4AC7R7/0BAjHZFBgUSm0lLN18X94F6mZYoa4tKb+U5JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286316; c=relaxed/simple;
	bh=RtIeB384TuPOlmJr4gr9STMS6UcFSUJiIgvscd+djw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFkxR6ps3CY2DYyyz7xo6zSHFIZVcKQ04rbDDgDdJQtTXuLEYXQEmnlopl0Fl3E+DedbPfPGznyflqDSI3AJJKKFeeELox3fXCPItGjUUKHSCZkP6/Q5tmQhAXFEpaBNyn0fS/NwE5D7Kow0PmKCnDY7LrvNNHobm3wR689O3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wkgNH-0007DX-00; Fri, 17 Jul 2026 13:04:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 2B475C013E; Fri, 17 Jul 2026 13:02:33 +0200 (CEST)
Date: Fri, 17 Jul 2026 13:02:33 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH] MIPS: kernel: proc: Use two seq_putc() calls in
 show_cpuinfo()
Message-ID: <aloLyYPIV39N_tQb@alpha.franken.de>
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
 <39fa676a-e761-4a33-9660-f366c692d4f1@web.de>
 <ajEs2UcAj-YmT1og@alpha.franken.de>
 <736e312c-1356-4d8f-8ae5-bcc695f555dc@web.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <736e312c-1356-4d8f-8ae5-bcc695f555dc@web.de>

On Mon, Jun 22, 2026 at 05:57:34PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 22 Jun 2026 17:50:13 +0200
> 
> Single line breaks should occasionally be put into a sequence.
> Thus use the corresponding function “seq_putc”.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/mips/kernel/proc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 5401c679813a..5f49fd4653a7 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -109,7 +109,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  		seq_puts(m, " mips64r5");
>  	if (cpu_has_mips64r6)
>  		seq_puts(m, " mips64r6");
> -	seq_puts(m, "\n");
> +	seq_putc(m, '\n');
>  
>  	seq_puts(m, "ASEs implemented\t:");
>  	if (cpu_has_mips16)
> @@ -273,7 +273,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  		seq_puts(m, " mm_sysad");
>  	if (cpu_has_mm_full)
>  		seq_puts(m, " mm_full");
> -	seq_puts(m, "\n");
> +	seq_putc(m, '\n');
>  
>  	seq_printf(m, "shadow register sets\t: %d\n",
>  		      cpu_data[n].srsets);
> -- 
> 2.54.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
