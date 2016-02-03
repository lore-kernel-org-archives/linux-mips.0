Received: from mailapp01.imgtec.com ([195.59.15.196]:33963 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011683AbcBCTnzCyGC3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 20:43:55 +0100
Date: Wed, 3 Feb 2016 19:43:44 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 2/3] MIPS: Add P6600 cases to CPU switch statements
In-Reply-To: <1454469999-17818-3-git-send-email-paul.burton@imgtec.com>
Message-ID: <alpine.DEB.2.00.1602031941170.15885@tp.orcam.me.uk>
References: <1454469999-17818-1-git-send-email-paul.burton@imgtec.com> <1454469999-17818-3-git-send-email-paul.burton@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Peter Zijlstra <peterz@infradead.org>, Joshua Kinard <kumba@gentoo.org>, Andrzej Hajda <a.hajda@samsung.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, Markos Chandras <markos.chandras@imgtec.com>, Petri Gynther <pgynther@google.com>
Message-ID: <20160203194344.HzTVGLqvtOnw2pwGzSYORMC9SYP7inkGQLtWBECHmag@z>

On Wed, 3 Feb 2016, Paul Burton wrote:

> diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
> index d7b8dd4..ae378d9 100644
> --- a/arch/mips/kernel/perf_event_mipsxx.c
> +++ b/arch/mips/kernel/perf_event_mipsxx.c
> @@ -1556,6 +1556,7 @@ static const struct mips_perf_event *mipsxx_pmu_map_raw_event(u64 config)
>  #endif
>  		break;
>  	case CPU_P5600:
> +	case CPU_P6600:
>  	case CPU_I6400:
>  		/* 8-bit event numbers */
>  		raw_id = config & 0x1ff;
> @@ -1718,6 +1719,11 @@ init_hw_perf_events(void)
>  		mipspmu.general_event_map = &mipsxxcore_event_map2;
>  		mipspmu.cache_event_map = &mipsxxcore_cache_map2;
>  		break;
> +	case CPU_P6600:
> +		mipspmu.name = "mips/P6600";
> +		mipspmu.general_event_map = &mipsxxcore_event_map2;
> +		mipspmu.cache_event_map = &mipsxxcore_cache_map2;
> +		break;
>  	case CPU_I6400:
>  		mipspmu.name = "mips/I6400";
>  		mipspmu.general_event_map = &mipsxxcore_event_map2;
> diff --git a/arch/mips/kernel/spram.c b/arch/mips/kernel/spram.c
> index 8489c88..d6e6cf7 100644
> --- a/arch/mips/kernel/spram.c
> +++ b/arch/mips/kernel/spram.c
> @@ -210,6 +210,7 @@ void spram_config(void)
>  	case CPU_P5600:
>  	case CPU_QEMU_GENERIC:
>  	case CPU_I6400:
> +	case CPU_P6600:
>  		config0 = read_c0_config();
>  		/* FIXME: addresses are Malta specific */
>  		if (config0 & (1<<24)) {

 Minor nit: you sometimes place the I6400 before and sometimes after the 
P6600 -- would it make sense to keep the ordering consistent?

  Maciej
