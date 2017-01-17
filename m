Received: from mail-sn1nam01on0077.outbound.protection.outlook.com ([104.47.32.77]:52852
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993893AbdAQSCtKLaO0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 17 Jan 2017 19:02:49 +0100
Subject: Re: [PATCH] octeon: prom_putchar() must be void
References: <20170117173644.27984-1-alexander.sverdlin@nokia.com>
 <20170117180033.GK31072@linux-mips.org>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <881d4269-414a-3b98-4099-74af7f54a4d7@caviumnetworks.com>
Date: Tue, 17 Jan 2017 10:02:36 -0800
MIME-Version: 1.0
In-Reply-To: <20170117180033.GK31072@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: Alexander Sverdlin <alexander.sverdlin@nsn.com>, David Daney <david.daney@cavium.com>, Aaro Koskinen <aaro.koskinen@nokia.com>, Florian Fainelli <f.fainelli@gmail.com>, "Steven J. Hill" <steven.hill@cavium.com>, linux-mips@linux-mips.org
Message-ID: <20170117180236.jvHVuddBW2aWDwZUk1ZsQ5LidfnPu3WFVVvzhf0w_6o@z>

On 01/17/2017 10:00 AM, Ralf Baechle wrote:
> On Tue, Jan 17, 2017 at 06:36:44PM +0100, Alexander Sverdlin wrote:
>> Date:   Tue, 17 Jan 2017 18:36:44 +0100
>> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>> To: unlisted-recipients: no To-header on input <;
>> CC: Alexander Sverdlin <alexander.sverdlin@nsn.com>, Alexander Sverdlin
>>  <alexander.sverdlin@nokia.com>, Ralf Baechle <ralf@linux-mips.org>, David
>>  Daney <david.daney@cavium.com>, Aaro Koskinen <aaro.koskinen@nokia.com>,
>>  "Steven J. Hill" <steven.hill@cavium.com>, linux-mips@linux-mips.org
>> Subject: [PATCH] octeon: prom_putchar() must be void
>> Content-Type: text/plain
>>
>> From: Alexander Sverdlin <alexander.sverdlin@nsn.com>
>>
>> Correct the function return type.
>
> Thanks Alexander.  There is another instance of the same issue in
> arch/mips/ar7/prom.c which I'm going to take care of.
>

If it were declared in a common .h file, this wouldn't have ever 
happened.  Perhaps you should add such a declaration.

>   Ralf
>
