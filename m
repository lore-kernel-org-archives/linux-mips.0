Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]:2121
        "EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6835074Ab3EWQ6QeClIE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 May 2013 18:58:16 +0200
Message-ID: <519E4A98.7020903@caviumnetworks.com>
Date: Thu, 23 May 2013 09:58:00 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/6] mips/kvm: Fix ABI for compatibility with 64-bit
 guests.
References: <1369248236-27237-1-git-send-email-ddaney.cavm@gmail.com> <20130523102834.GN4725@redhat.com>
In-Reply-To: <20130523102834.GN4725@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Gleb Natapov <gleb@redhat.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, kvm@vger.kernel.org, Sanjay Lal <sanjayl@kymasys.com>, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20130523165800.4TahhRcQznawxtScO6Dey7mG__mtMBcC4eK2K1E0iY0@z>

On 05/23/2013 03:28 AM, Gleb Natapov wrote:
> On Wed, May 22, 2013 at 11:43:50AM -0700, David Daney wrote:
>> From: David Daney <david.daney@cavium.com>
>>
> Please regenerate against master. arch/mips/include/asm/kvm.h does not
> exists any more.

New patch sent.  I gather from this message, that you want to merge this 
particular set via your tree instead of Ralf's MIPS tree.  That's fine 
with me.  However, we were hoping to have these ABI fixing patches 
pushed to Linus before 3.10 releases, so that there don't exist kernel 
versions with the defective ABI.

Future patch sets may affect core MIPS architecture files, and therefore 
may not be so amenable to merging via the KVM tree.  We will have to 
figure out how to handle that.

David Daney
