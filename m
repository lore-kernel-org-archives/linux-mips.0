Received: from mailapp01.imgtec.com ([195.59.15.196]:16481 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009999AbbGIQGGX0clm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 18:06:06 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 4F37E529179E4
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 17:05:57 +0100 (IST)
Subject: Re: [PATCH 05/19] MIPS: asm: mips-cm: Implement mips_cm_revision
References: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
 <1436434853-30001-6-git-send-email-markos.chandras@imgtec.com>
 <559E5B21.3030407@imgtec.com>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <559E9BE7.3040202@imgtec.com>
Date: Thu, 9 Jul 2015 17:05:59 +0100
MIME-Version: 1.0
In-Reply-To: <559E5B21.3030407@imgtec.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150709160559.ZH0qGbRmOJlJBiKIsf99p_ay2TydtM_7toR-t6XV3-s@z>

On 07/09/2015 12:29 PM, James Hogan wrote:
> Hi Markos,
> 
> On 09/07/15 10:40, Markos Chandras wrote:
>> From: Paul Burton <paul.burton@imgtec.com>
>>
>> Provide a function to trivially return the version of the CM present in
>> the system, or 0 if no CM is present. The mips_cm_revision() will be
>> used later on to determine the CM register width, so it must not use
>> the regular CM accessors to read the revision register since that will
>> lead to build failures due to recursive inlines.
>>
>> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>>  arch/mips/include/asm/mips-cm.h | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
>> index edc7ee95269e..29ff74a629f6 100644
>> --- a/arch/mips/include/asm/mips-cm.h
>> +++ b/arch/mips/include/asm/mips-cm.h
>> @@ -189,6 +189,13 @@ BUILD_CM_Cx_R_(tcid_8_priority,	0x80)
>>  #define CM_GCR_REV_MINOR_SHF			0
>>  #define CM_GCR_REV_MINOR_MSK			(_ULCAST_(0xff) << 0)
>>  
>> +#define CM_ENCODE_REV(major, minor) \
>> +		((major << CM_GCR_REV_MAJOR_SHF) | \
>> +		 ((minor) << CM_GCR_REV_MINOR_SHF))
>> +
>> +#define CM_REV_CM2				CM_ENCODE_REV(6, 0)
>> +#define CM_REV_CM3				CM_ENCODE_REV(8, 0)
>> +
>>  /* GCR_ERROR_CAUSE register fields */
>>  #define CM_GCR_ERROR_CAUSE_ERRTYPE_SHF		27
>>  #define CM_GCR_ERROR_CAUSE_ERRTYPE_MSK		(_ULCAST_(0x1f) << 27)
>> @@ -324,4 +331,26 @@ static inline int mips_cm_l2sync(void)
>>  	return 0;
>>  }
>>  
>> +/**
>> + * mips_cm_revision - return CM revision
> 
> don't forget brackets: "mips_cm_revision()"
> 
>> + *
>> + * Returns the revision of the CM, from GCR_REV, or 0 if no CM is present.
>> + * The return value should be checked against the CM_REV_* macros.
> 
> Use "Return: bla bla bla." so it lands in a nice return section.
> 
> see Documentation/kernel-doc-nano-HOWTO.txt for an example.
> 
> Cheers
> James
> 
Ok thanks I will fix it.

-- 
markos
