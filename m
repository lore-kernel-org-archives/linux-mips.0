Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0B539FCDB;
	Tue,  7 Apr 2026 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559900; cv=none; b=WebFaLsUWRtyNjJYo+yqXeY1CdhH4xONfdF3ikR7+6XieqCYhKpoHwo1dAeOA33rGaxOUcQ/PDJMvVnzVisL5pN8giqOK3n9gLjJIjZ/vI/TV6LhITF54FdFL/P4ZqRL6Q5LZk3WgNU2GNE4fZaTqZOGSiAJTom32XVjkhLAD+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559900; c=relaxed/simple;
	bh=eSzo8eXtTykCqDO8H8ORL2VgTh7AzNJfEA6wWBENwCM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aKXIj36hI/9C8bfO8CpGXgiIooS+ujP/RiqKsReX8hcsohoTFGx9wQqrcHAumZvvcTQIP/XSgGIWHxZH5BbXpNIg8Yp++9P0O/pZfAYSADJ1NPjC5MBsdRLzwsH+F1FBKsQqaSlHkj7lFKRJRFCy0byGPWw9PwjKeWRdF6PMfoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C0E1292009C; Tue,  7 Apr 2026 12:58:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BEBA592009B;
	Tue,  7 Apr 2026 11:58:03 +0100 (BST)
Date: Tue, 7 Apr 2026 11:58:03 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Stefan Wiehler <stefan.wiehler@nokia.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: mm: Call rcutree_report_cpu_starting() even
 earlier
In-Reply-To: <20260407083324.906742-2-stefan.wiehler@nokia.com>
Message-ID: <alpine.DEB.2.21.2604071142530.29980@angie.orcam.me.uk>
References: <20260407083324.906742-2-stefan.wiehler@nokia.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Apr 2026, Stefan Wiehler wrote:

> diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> index 24fe85fa169d..49cb5262df1e 100644
> --- a/arch/mips/mm/tlb-r4k.c
> +++ b/arch/mips/mm/tlb-r4k.c
> @@ -744,12 +745,18 @@ static void __ref r4k_tlb_uniquify_write(struct tlbent *tlb_vpns, int tlbsize)
>   */
>  static void __ref r4k_tlb_uniquify(void)
>  {
> +	unsigned int cpu = raw_smp_processor_id();
>  	int tlbsize = current_cpu_data.tlbsize;
>  	bool use_slab = slab_is_available();
> +	static bool secondary = false;
>  	phys_addr_t tlb_vpn_size;
>  	struct tlbent *tlb_vpns;
>  
>  	tlb_vpn_size = tlbsize * sizeof(*tlb_vpns);
> +	if (secondary)
> +		rcu_cpu_starting(cpu);
> +	else
> +		secondary = true;

 You could use `use_slab' to figure out whether it is a secondary CPU, but 
the right fix AFAICT is to reorder the `rcutree_report_cpu_starting' ahead 
of `per_cpu_trap_init' in `start_secondary', possibly even to the start of 
the function (does it rely on any of the initialisation done earlier on?).

 NB is `rcu_cpu_starting' the right function call to make, and where does 
`cpu' come from here?

 Thanks for the report!

  Maciej
