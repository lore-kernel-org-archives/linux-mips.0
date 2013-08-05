Received: from multi.imgtec.com ([194.200.65.239]:15563 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823064Ab3HENSUGW5cT (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 5 Aug 2013 15:18:20 +0200
Message-ID: <51FFA5CD.3010406@imgtec.com>
Date: Mon, 5 Aug 2013 14:17:01 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] mips/kvm: Improve code formatting in arch/mips/kvm/kvm_locore.S
References: <1375388555-4045-1-git-send-email-ddaney.cavm@gmail.com> <1375388555-4045-2-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1375388555-4045-2-git-send-email-ddaney.cavm@gmail.com>
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
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, kvm@vger.kernel.org, Sanjay Lal <sanjayl@kymasys.com>, Gleb Natapov <gleb@redhat.com>, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20130805131701.HvTukexqKg0cvKHSnnCP1pBhLTxC6tT0kFAD8bHVZUE@z>

Hi David,

On 01/08/13 21:22, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> No code changes, just reflowing some comments and consistently using
> tabs and spaces.  Object code is verified to be unchanged.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> Acked-by: Ralf Baechle <ralf@linux-mips.org>


> +   	 /* Put the saved pointer to vcpu (s1) back into the DDATA_LO Register */

git am detects a whitespace error here ("space before tab in indent").
It's got spaces before and after the tab actually.

>      /* load the guest context from VCPU and return */

this comment could have it's indentation fixed too

Otherwise, for all 3 patches:

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Thanks
James
