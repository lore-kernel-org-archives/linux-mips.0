Received: from mailapp01.imgtec.com ([195.59.15.196]:2448 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822271AbaEULONuvhDX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 May 2014 13:14:13 +0200
Message-ID: <537C89B5.2030907@imgtec.com>
Date: Wed, 21 May 2014 12:10:45 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 07/15] MIPS: Add mips_cpunum() function.
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1400597236-11352-8-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400597236-11352-8-git-send-email-andreas.herrmann@caviumnetworks.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, linux-mips@linux-mips.org
Cc: David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521111045.LjeUTF0snySDfY2h6VGqNJLjbzHsJ_WEDRxmgRWjTp0@z>

On 20/05/14 15:47, Andreas Herrmann wrote:
> From: David Daney <david.daney@cavium.com>
> 
> This returns the CPUNum from the low order Ebase bits.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> ---
>  arch/mips/include/asm/mipsregs.h |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index 3e025b5..f110d48 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -1916,6 +1916,11 @@ __BUILD_SET_C0(brcm_cmt_ctrl)
>  __BUILD_SET_C0(brcm_config)
>  __BUILD_SET_C0(brcm_mode)
>  
> +static inline unsigned int mips_cpunum(void)
> +{
> +	return read_c0_ebase() & 0x3ff; /* Low 10 bits of ebase. */
> +}

If this is going to go in mips generic code I think it should be clearly
defined, especially in the presence of MT, otherwise perhaps it makes
sense for it to go in a paravirt specific header?

I.e. does it return the core number of the running VPE (if so it should
probably do something like below as in decode_configs() and go in
smp.h), or does it simply always return that field in ebase register (in
which case it should probably have ebase in the name and a comment to
clarify that it doesn't necessarily map directly to core/vpe number).

unsigned int core = read_c0_ebase() & 0x3ff;
if (cpu_has_mipsmt)
	core >>= fls(smp_num_siblings) - 1;

Cheers
James
