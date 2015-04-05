Received: from mail-qc0-f169.google.com ([209.85.216.169]:34832 "EHLO
        mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007518AbbDEDZ2OMg2a (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 5 Apr 2015 05:25:28 +0200
Received: by qcbii10 with SMTP id ii10so1838610qcb.2
        for <linux-mips@linux-mips.org>; Sat, 04 Apr 2015 20:25:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJyH==8OtkcU8_P4_47U6qe6FYqj-WUZ20_Y+iC_OF4_w@mail.gmail.com>
References: <1427857069-6789-1-git-send-email-yinghai@kernel.org>
 <1427857069-6789-2-git-send-email-yinghai@kernel.org> <20150403193234.GD10892@google.com>
 <20150403205201.GF10892@google.com> <CAE9FiQVqAEvoLDRZMcNFki0gLMQiyQd2VYivjAh1teRGeuNwBw@mail.gmail.com>
 <CAErSpo55rpO6SNeY57zZ8ah0PJ3eY+-L92vUJwYiRn4tCfLtJg@mail.gmail.com> <CAL_JsqJyH==8OtkcU8_P4_47U6qe6FYqj-WUZ20_Y+iC_OF4_w@mail.gmail.com>
From: Bjorn Helgaas <bhelgaas@google.com>
Date: Sat, 4 Apr 2015 22:25:03 -0500
Message-ID: <CAErSpo4cw2MSPmrur_QFMwnH01qf0XMfBEAyZ2f+HrUOGEXyjw@mail.gmail.com>
Subject: Re: [PATCH 1/3] PCI: Introduce pci_bus_addr_t
Content-Type: text/plain; charset=UTF-8
Return-Path: <bhelgaas@google.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robherring2@gmail.com>
Cc: Yinghai Lu <yinghai@kernel.org>, David Ahern <david.ahern@oracle.com>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@arm.linux.org.uk>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, David Miller <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20150405032503.ndGSdAN5mY-fDxZb7VgjYAB-O1V7NLCgKo0K-szspbg@z>

On Sat, Apr 4, 2015 at 2:48 PM, Rob Herring <robherring2@gmail.com> wrote:
> On Sat, Apr 4, 2015 at 7:46 AM, Bjorn Helgaas <bhelgaas@google.com> wrote:

>> I think there's still an unresolved question about the OF parsing code.
>
> Got a pointer to what that is? I'll take a guess. Generally, we make
> the parsing code independent of the kernel addr sizes and use u64
> types. The DT sizes and kernel sizes are not always aligned. For
> example, an LPAE capable platform running a non-LPAE kernel build.

Yep: http://lkml.kernel.org/r/1427857069-6789-3-git-send-email-yinghai@kernel.org

Yinghai made a change to the sparc OF parsing code.  The question is
whether a similar change should be made to clones of that code (two
others in arch/sparc, one in arch/powerpc, and one in drivers/of).

Bjorn
