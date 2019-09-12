---
AIP: 00
Title: AIP Objectives and Guidelines
Author(s): Sam Pajot-Phipps (sam@aion.network)
Type: Procedure
Status: Accepted
Creation Date: 2019-08-15
Contact Information:
---

## AIP Definition

An AIP is an Aion Improvement Proposal. An AIP can be proposed by anyone in the Aion community. The proposal is a document which provides a concise overview to the Aion community of a new process, functionality, standard or convention. The document should be thorough, technically precise and provide a clear motivation for the proposal. Proposal are submitted by one or more authors, these authors are responsible for the creation, modifications, socialization and most importantly - consensus building around the proposal.

## Objective of AIP's 

AIP’s serve as the formal process for the Aion community to suggest, debate, collaborate and come to a consensus on improvements to the Aion codebase and its surrounding ecosystem. AIP’s and this repository also serve as a documentation trail for all upgrades, discussions and suggestions. 

## Types of AIP's

1. Standard: Standard AIP’s cover the majority of changes to the Aion network. These AIP’s target improvements to the protocol, consensus, formats and proposals to create standards and conventions. Standard proposals are classified in the following categories:

   * Core: Improvement proposals that relate to core protocol design. Such as consensus, hashing algorithms, mining..etc
   * Networking: Improvement proposals that relate to peer-to-peer communication, and messaging
   * Interface: Improvement proposals related to clients, API’s/RPC design and specs (ex: Web3.js, Java)
   * ASC: Aion Standards & Conventions are proposals related to application layer elements such as token standards, registries, wallet & address formats

2. Memo: A Memo AIP covers general information, guidelines, or templates as they relate to the broader Aion community. These can be viewed as more of a public memo for discussion and does not propose a material technical change.

3. Procedure: Procedure AIP’s relate to surrounding processes, decision-making, and governance of the Aion ecosystem. While these might not result in material technical changes, they still require engagement amongst the community and will result in changes that individuals may action.

## AIP Content Template

### Header
 * Title
 * Author(s)
 * Type 
 * Status
 * Created Date
 * Contact Information

### Summary
 *  One sentence summary of the proposal

### Value Proposition 
 *  Brief summary of what value this improvement provides to the overall Aion community.

### Motivation
 * Explain the motivation for submitting this proposal. Who does it benefit and why is it needed? Provide any relevant data or research.

### Non-Goals
 * Provide a brief explanation of what is out-of-scope for this proposal and what it is not designed to achieve. 

### Success Metrics
 * If applicable, what metrics and benchmarks can be tracked to evaluate the success of this proposal.

### Description
 *  Summary of the context and proposed improvement.

### Specification
 * Technical specification of the proposed improvement containing the appropriate syntax and semantics. Should cover the various active implementations of Aion. 

### Logic
 * Walk-through of the design and specification considerations, choices and approach. Provide practical examples of similar implementations, feedback from the community and perspectives on possible concerns.

### Risks & Assumptions
* Breakdown potential risks introduced by this proposal. How does it affect compatibility? Are there any internal or external events that could threaten the effectiveness of this proposal? Provide mitigation strategies for all listed risks and identify any assumptions.

### Test Cases
  * Provide test cases for the improvements implementation. Test cases are essential in “Core” improvement proposals. 

### Implementations
 * Proposed code to be implemented. This section must be complete and adopted for the AIP to be set to “Final”. Implementations must cover the majority of active Aion clients. 

### Dependencies
 * Identify any other AIP's, modules, libraries, or API's that are dependencies for this AIP to be implemented or achieve its value proposition.

### Copyright
 * All AIP’s are public domain. Copyright waiver to be linked 
 to https://creativecommons.org/publicdomain/zero/1.0/

## Process Flow

This repository will be the primary source for AIP’s submissions, reviews, discussions and adoption. 
AIP’s begin with an improvement idea for the Aion network. This AIP can be related to any of the above categories, ranging from core technical proposals to informational nature. AIP’s should be composed as a standalone proposal, containing concise detail on a single improvement. In the case of complex AIP’s all related content should be contained within the single AIP. Non-related improvements within a single proposal may be split into multiple AIP’s (editor to suggest to author) along with related AIP’s being migrated into a single co-authored proposal (editor suggestion). The AIP editor will manage the overall hygiene of this repository and reserves the right to reject AIP’s that are non-sensical or unrelated. 

### Socialization Phase

For an AIP to be submitted it must have an author. This author or co-authors will be the owner and manager of their AIP. Author(s) will be responsible for the maintenance of their proposal and the outreach efforts to gain awareness, discussion and ultimately consensus. Before composing an AIP it is essential to gain input and feedback from the Aion community across the various channels. Getting this initial support, awareness and feedback will create a higher quality proposal and will be met with higher engagement. The Aion Forum, Reddit, Gitter, and Discord are popular channels where core community members congregate. 

Following this *Socialization* Phase, the author(s) shall submit the AIP draft as a pull request to this repo and commence the *Draft* status. 

### Draft

During the *Draft* status, AIP’s must complete:

1. Soundness: The AIP editor will evaluate the AIP on the basis of completion and technical feasibility (is the logic sound?)

 2. Formatting: The AIP editor will enforce formatting standards of the *Draft* AIP

If approved by the AIP editor, the AIP PR will be merged and tagged with the appropriate category, number, date and status by the AIP editor. The Author is also asked to create an issue in the repo for the AIP. The AIP editor has the ability to reject the AIP draft on the basis of an incomplete submission, redundant submission or technically unsound. 

Once the PR has been included into the repo, the AIP begins the *Review* stage and status.

### Review

During the *Review* status, AIP’s must complete:

 1. Design Description: Overview on the improvements technical design and specification
 
 2. Discussion: Comprehensive analysis and discussion amongst the Aion community and core contributors across channels (AIP Repo, Aion Forum, Reddit, Gitter). 

 3. Town Hall (For AIP Type: Standard, Non-ASC): AIP’s that have received comprehensive discussion and attention will be brought to the core developer community town hall call. The AIP Author is responsible for requesting their AIP be added to the Town Hall agenda. During this call the AIP will be vetted and debated. Following their allotted time, each AIP on the agenda with receive one of the following flags: 
   * Move to *Accepted*
   * Require offline review (Add to next Agenda)
   * Require additional town hall discussion (Add to next Agenda)
   * Request the Author provide additional details, analysis or public consultation

It is critical that for the status to be *Accepted* the proposed improvement must present a net benefit to the protocol and the overall Aion community. 

For AIP Types; ASC, Procedure and Memo, following comprehensive discussion the AIP Author will request that the AIP Editor change the status to *Final*. The AIP Editor will make an announcement "Final Call" calling for any final feedback or concerns. If no significant concerns are raised within two weeks, the AIP is moved to *Final*. If issues are raised, the Author will address the concerns, make changes if required then request the AIP Editor make a "Final Call" announcement. ASC, Procedure and Memo do not use the *Accepted* status. 

### Accepted

During the *Accepted* status, Standard AIP’s (Non-ASC) must complete:

 1. Implementation: Proposed implementation code. This code must be complete, of the utmost quality and not cause trivial complexity. 
   * **Core**: The Technical Steering Committee will review proposed implementation code, provide feedback and conclude with a recommended course of action. The Technical Steering Committee must review and provide a response to the Core AIP within 30 days of receiving the *Accepted* status.

 2. Planning: The core developer community will plan the implementation timeline and procedure
   * **Core**: Collaboration with the Technical Steering Committee to schedule the improvement with planned major upgrades
   * **Non-Core**: Schedule the improvement upgrade release

 3. Execution: The improvement is implemented into the major clients
   * **Core**: The improvement must be implemented into the majority of active clients for it be considered 
 *Final*
   * **Non-Core**: The improvement must be implemented into at least one client to be considered *Final*

Throughout this process AIP’s can be set to *Rejected* or *Deferred* by the Author(s) or the AIP Editor.
If an AIP is finalized that addresses the improvements proposed by another AIP, the original may be replaced with the Author(s) being migrated over. 

Once the AIP has successfully met the required execution criteria, its status will be updated to *Final*

Once an AIP has reached the *Final* status, the list of final AIP’s will be updated on the repo and depending on its content, related Aion documentation will be updated (whitepaper, wikis, policies)

## Definitions

 1. AIP: Aion Improvement Proposal

 2. AIP Editor: Member of the community that has been assigned as the AIP Editor. Responsible for managing the AIP Repo and enforcing the AIP guidelines

 3. Town Hall Call: A routine call held by the Aion Foundation where core contributors from the major Aion client implementations, dApps and Miners discuss roadmap, on-going research, priorities and AIP’s. Town hall calls will occur on a monthly basis, until the volume of AIP's require bi-weekly calls. The agenda and observation links shall be posted on the AIP repo 48 hours in advance. 

 5. Technical Steering Committee: The Technical Steering Committee is a governance body composed of representatives from major Aion client implementations and the Aion Foundation. This committee brings together a diverse set of opinion and technical experience to evaluate *Accepted* Core AIP’s and provide a recommended course of action. 

## Status Definition

Phase / Status | Description
------------ | -------------
Socialization | The Author(s) socialize the proposed AIP amongst community members across Aion channels
Draft | The Author(s) submit their AIP based on the template and format as a PR
Review | The AIP is under review and discussion by the community across various channels and the town hall
Accepted | The AIP’s implementation code is proposed and the executed across the active clients
Final | The AIP has been adopted by the majority of active clients (core); AIP has passed "Final Call" (ASC, Procedure, Memo)
Rejected | If there is consensus among the community that this AIP is no longer needed, feasible or wanted.
Replaced | The AIP has been replaced by a subsequent AIP that addresses the improvement
Deferred | If the AIP has been inactive or abandoned by the Author(s) or community

## AIP Process Flow (Non-Core)
![image](https://user-images.githubusercontent.com/34580301/44487703-f38df380-a624-11e8-9412-dec714a91794.png)


## AIP Process Flow (Core) 
![core_aip_flow](https://user-images.githubusercontent.com/34580301/44746396-43166880-aad8-11e8-86f1-258c7126cf58.png)


## History
This document was inspired by Ethereum’s EIP-01 by Martin Becze and Hudson Jameson and Bitcoin’s BIP-0001 by Amir Taaki which was derived from Python’s PEP-0001. It also drew suggestions from the JEP process for OpenJDK and EIP draft #956.
