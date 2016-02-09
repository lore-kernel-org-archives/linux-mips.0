Received: from mailapp01.imgtec.com ([195.59.15.196]:4841 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011766AbcBIVTL3jjub (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Feb 2016 22:19:11 +0100
Date: Tue, 9 Feb 2016 21:19:03 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 1/6] MIPS: BMIPS: Disable pref 30 for buggy CPUs
In-Reply-To: <1455051354-6225-2-git-send-email-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.00.1602092101240.15885@tp.orcam.me.uk>
References: <1455051354-6225-1-git-send-email-f.fainelli@gmail.com> <1455051354-6225-2-git-send-email-f.fainelli@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, blogic@openwrt.org, cernekee@gmail.com, jon.fraser@broadcom.com, pgynther@google.com, paul.burton@imgtec.com, ddaney.cavm@gmail.com
Message-ID: <20160209211903.sDXdsErTptnb9fq71e2HzkJekoeZvH0D41Rhcu53z50@z>

On Tue, 9 Feb 2016, Florian Fainelli wrote:

> +static void bmips5000_pref30_quirk(void)
> +{
> +	__asm__ __volatile__(
> +	"	.word	0x4008b008\n"	/* mfc0 $8, $22, 8 */
> +	"	lui	$9, 0x0100\n"
> +	"	or	$8, $9\n"
> +	/* disable "pref 30" on buggy CPUs */
> +	"	lui	$9, 0x0800\n"
> +	"	or	$8, $9\n"
> +	"	.word	0x4088b008\n"	/* mtc0 $8, $22, 8 */
> +	: : : "$8", "$9");
> +}

 Ouch, why not using our standard accessors and avoid magic numbers, e.g.:

#define read_c0_brcm_whateverthisiscalled() \
	__read_32bit_c0_register($22, 8)
#define write_c0_brcm_whateverthisiscalled(val) \
	__write_32bit_c0_register($22, 8, val)

#define BMIPS5000_WHATEVERTHISISCALLED_BIT_X 0x0100
#define BMIPS5000_WHATEVERTHISISCALLED_BIT_Y 0x0800

static void bmips5000_pref30_quirk(void)
{
	unsigned int whateverthisiscalled;

	whateverthisiscalled = read_c0_brcm_whateverthisiscalled();
	whateverthisiscalled |= BMIPS_WHATEVERTHISISCALLED_BIT_X;
	/* disable "pref 30" on buggy CPUs */
	whateverthisiscalled |= BMIPS_WHATEVERTHISISCALLED_BIT_Y;
	write_c0_brcm_whateverthisiscalled(whateverthisiscalled);
}

?  I'm leaving it up to you to select the right names here -- just about 
anything will be better than the halfway-binary piece you have proposed.

 FYI, we already have BMIPS5000 accessors defined up to ($22, 7) in 
<asm/mipsregs.h> so it will be the right place for the new ones as well.

  Maciej
