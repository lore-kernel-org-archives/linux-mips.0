Received: from mailapp01.imgtec.com ([195.59.15.196]:38036 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816503AbaFYJLQ1Vgal (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Jun 2014 11:11:16 +0200
Message-ID: <53AA922D.9020604@imgtec.com>
Date: Wed, 25 Jun 2014 10:11:09 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 5/9] MIPS: KVM: Rename files to remove the prefix "kvm_"
 and "kvm_mips_"
References: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com> <1403631071-6012-6-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1403631071-6012-6-git-send-email-dengcheng.zhu@imgtec.com>
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
To: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>, pbonzini@redhat.com
Cc: gleb@kernel.org, kvm@vger.kernel.org, sanjayl@kymasys.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20140625091109.PdhXwfmWAbpDxLI5pwlq3cZVwg6pl5dt9V9o05MNzXg@z>

On 24/06/14 18:31, Deng-Cheng Zhu wrote:
> From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
> 
> Since all the files are in arch/mips/kvm/, there's no need of the prefixes
> "kvm_" and "kvm_mips_".
> 
> Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

Thanks for this cleanup! (hopefully with git's help it won't make
backporting patches a pain).

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James
