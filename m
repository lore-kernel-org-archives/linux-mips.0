Received: from mail-yw0-f49.google.com ([209.85.213.49]:65449 "EHLO
        mail-yw0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903694Ab2CISBL convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 9 Mar 2012 19:01:11 +0100
Received: by yhjj52 with SMTP id j52so1147529yhj.36
        for <linux-mips@linux-mips.org>; Fri, 09 Mar 2012 10:01:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F5A44E5.6090300@cavium.com>
References: <1330543264-18103-1-git-send-email-ddaney.cavm@gmail.com>
 <1330543264-18103-3-git-send-email-ddaney.cavm@gmail.com> <20120309013324.64DF53E0901@localhost>
 <4F5A44E5.6090300@cavium.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Fri, 9 Mar 2012 11:00:44 -0700
Message-ID: <CACxGe6v3wnRdyaWeuBZ1RMQf8KD3dV2btQKrrmPAUgQtym_e_g@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] of: Make of_find_node_by_path() traverse /aliases
 for relative paths.
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: David Daney <david.daney@cavium.com>
Cc: David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20120309180044.rLhQpueLBDVdHyBAXNiUNYB_sEycMXwI35IrYp6w3rc@z>

On Fri, Mar 9, 2012 at 10:59 AM, David Daney <david.daney@cavium.com> wrote:
> On 03/08/2012 05:33 PM, Grant Likely wrote:
>>
>> On Wed, 29 Feb 2012 11:21:04 -0800, David Daney<ddaney.cavm@gmail.com>
>>  wrote:
>>>
>>> From: David Daney<david.daney@cavium.com>
>>>
>>> Currently all paths passed to of_find_node_by_path() must begin with a
>>> '/', indicating a full path to the desired node.
>>>
>>> Augment the look-up code so that if a path does *not* begin with '/',
>>> the path is used as the name of an /aliases property.  The value of
>>> this alias is then used as the full node path to be found.
>>>
>>> Signed-off-by: David Daney<david.daney@cavium.com>
>
> [...]
>
>>
>> All the aliases are already decoded at boot time now.  See
>> of_alias_scan().  Instead of open-coding this, you can add an
>> of_alias_lookup() function something like this (untested):
>>
>
> After objections from davem, and a bit of thought, I already indicated on a
> different branch of this thread that we should drop this patch.
>
> I have improved my code so that it is no longer needed.

Okay.
