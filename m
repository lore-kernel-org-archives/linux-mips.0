Received: from omzsmtpe03.verizonbusiness.com ([199.249.25.208]:7920 "EHLO
        omzsmtpe03.verizonbusiness.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992249AbcIRArIFC7F8 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 18 Sep 2016 02:47:08 +0200
From: "Levin, Alexander" <alexander.levin@verizon.com>
Date: Sat, 17 Sep 2016 20:46:55 -0400
Subject: Re: [PATCH BACKPORT 3.10-3.16] MIPS: KVM: Check for pfn noslot case
Message-ID: <20160918004655.GB16340@sasha-lappy>
References: <8d00898f91834454a4daf5c4944ddace9c6866f4.1473975914.git-series.james.hogan@imgtec.com>
 <20160915220829.GB17443@1wt.eu>
In-Reply-To: <20160915220829.GB17443@1wt.eu>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <alexander.levin@verizon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Willy Tarreau <w@1wt.eu>
Cc: James Hogan <james.hogan@imgtec.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, =?iso-8859-1?Q?Radim_Kr=3F=3Fm=E1=3F=3F?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Message-ID: <20160918004655.yoOx4U9t8xJpm0U_30P8-ToF20-ptZPInoBqWXeaykw@z>

On Fri, Sep 16, 2016 at 12:08:29AM +0200, Willy Tarreau wrote:
> On Thu, Sep 15, 2016 at 10:51:27PM +0100, James Hogan wrote:
> > commit ba913e4f72fc9cfd03dad968dfb110eb49211d80 upstream.
> (...)
> 
> Queued for 3.10, thank you James.

And 3.18 + 4.1. Thanks James!

-- 

Thanks,
Sasha
