Received: from smtprelay.synopsys.com ([198.182.47.9]:57501 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27041988AbcFUFauFGjM- convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 21 Jun 2016 07:30:50 +0200
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] devpts: remove DEVPTS_MULTIPLE_INSTANCES from all
 configs
Date: Tue, 21 Jun 2016 05:30:40 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750106944A83@us01wembx1.internal.synopsys.com>
References: <20160620091258.11233-1-00moses.alexander00@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Vineet.Gupta1@synopsys.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexandru Moise <00moses.alexander00@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "bamvor.zhangjian@linaro.org" <bamvor.zhangjian@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20160621053040.D0As1Ud9Eui0Os4Fq3AYWB3grn5VBiPRSdrce0h96lc@z>

On Monday 20 June 2016 02:44 PM, Alexandru Moise wrote:
> As each mount of devpts is now an independent filesystem,
> the DEVPTS_MULTIPLE_INSTANCES config option no longer exists.
> So remove it.
>
> Signed-off-by: Alexandru Moise <00moses.alexander00@gmail.com>

For arch/arc

Acked-by: Vineet Gupta <vgupta@synopsys.com>
