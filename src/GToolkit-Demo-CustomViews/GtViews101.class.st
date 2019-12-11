"
I am presentation about custom views.
"
Class {
	#name : #GtViews101,
	#superclass : #Object,
	#category : #'GToolkit-Demo-CustomViews'
}

{ #category : #'as yet unclassified' }
GtViews101 >> contactsInAddressBookExample [
	^ ((GtABCartoonAddressBookExample new cartoonAddressBook gtViewContactsCardsListOn: GtPhlowView empty) 
		asElementDo: [:e |
			BlElement new
				look: BrShadowLook;
				background: Color white;
				margin: (BlInsets all: 20);
				addChild: e]) size: 400@400.
]

{ #category : #'as yet unclassified' }
GtViews101 >> contactsInAddressBookViewCode [
	^ (((GtABAddressBook>>#gtViewContactsCardsListOn:) gtSourceFor: GtPhlowView empty) asElementDo: [:e |
		BlElement new
			look: BrShadowLook;
			background: Color white;
			margin: (BlInsets all: 20);
			addChild: e]) size: 400@400.
]

{ #category : #'api - instantiation' }
GtViews101 >> create [
	| show |
	show := GtSlideShow new.
	show slides: {
		(GtFilePictureSlide new fileReference:
			(GtIcebergUtility documentAtPath:
				Path * 'feenkcom' / 'gtoolkit' / 'doc' / 'gtoolkit.png')).
		(GtTitleSlide new titleText:
			('custom views' asRopedText
				fontSize: 50;
				glamorousRegularFont)).
		(GtTextAndElementSlide new
			element: [GtRawViewsSlide new asElement ];
			textWithFormat:
				('Views give us specific representations for the objects we are inspecting'
					asRopedText
					glamorousRegularFont;
					fontSize: 20;
					foreground: Color gray)).
		(GtTextAndElementSlide new
			element: [self hotelRawViewExample];
			textWithFormat: 
				('For example, look at the following raw view for an Hotel object'
					asRopedText
					glamorousRegularFont;
					fontSize: 20;
					foreground: Color gray)).
		(GtTextSlide new
			firstTextWithFormat:
				('But that view does not say a lot'
					asRopedText
					glamorousRegularFont;
					fontSize: 20)).
		(GtTextAndElementSlide new
			element: [self hotelRoomsViewExample];
			textWithFormat:
				('So how about one that shows the rooms in the hotel?'
					asRopedText
					glamorousRegularFont;
					fontSize: 20;
					foreground: Color gray)).
		(GtElementSlide new 
			element: [GtViewsPresentationExamples new inspectorOnHotelObjectExample]).
		(GtTextAndElementSlide new 
			element: [GtPlaygroundSlide new
				snippets: {'#gtView gtPragmas'}; asElement];
			textWithFormat: 
				('Inspect this querry to see more examples of views implementation' 
					asRopedText
					glamorousRegularFont;
					fontSize: 20;
					foreground: Color gray)).
		(GtElementSlide new
			element: [GtViewsPresentationExamples new pragmasMetricsViewExample]).
		(GtTextSlide new
			firstTextWithFormat:
				('Now lets use an address book.' 
					asRopedText
					glamorousRegularFont;
					fontSize: 20);
			secondTextWithFormat:
				('And lets say we want to see the contacts in it.'
					asRopedText
					glamorousRegularFont;
					fontSize: 20)).
		(GtTextAndElementSlide new
			element: [self contactsInAddressBookViewCode];
			textWithFormat:
				('So in 16 lines of code'
					asRopedText
					glamorousRegularFont;
					foreground: Color gray;
					fontSize: 20)).
		(GtTextAndElementSlide new
			element: [self contactsInAddressBookExample];
			textWithFormat:
				('we got a helpful visualization'
					asRopedText
					glamorousRegularFont;
					foreground: Color gray;
					fontSize: 20)).
		(GtTitleSlide new
			title:
				('Now lets see how do we create these views'
					asRopedText
					glamorousRegularFont;
					fontSize: 20)).
		(GtElementSlide new
			element: ["GtViewsPresentationExamples new viewCodeExample"]). "contactsListExample"
		(GtElementSlide new
			element: ["GtViewsPresentationExamples new gtViewColumnedListCodeExample"]).
		(GtElementSlide new
			element: ["GtViewsPresentationExamples new gtViewListCodeExample"]).
		(GtElementSlide new
			element: ["GtViewsPresentationExamples new gtViewMondrianCodeExample"]).
		(GtElementSlide new
			element: ["GtViewsPresentationExamples new gtViewExplicitCodeExample"]) }.
	
	^ show
]

{ #category : #'as yet unclassified' }
GtViews101 >> hotelRawViewExample [
	^ ((HotelExamples new hotelWithOneRoom gtRawFor: GtPhlowView empty) asElementDo: [:e |
		BlElement new
			look: BrShadowLook;
			background: Color white;
			margin: (BlInsets all: 20);
			addChild: e]) size: 400@400.
]

{ #category : #'as yet unclassified' }
GtViews101 >> hotelRoomsViewExample [
	^ ((HotelExamples new hotelWithThreeRooms gtRoomsFor: GtPhlowView empty) asElementDo: [:e |
		BlElement new
			look: BrShadowLook;
			background: Color white;
			margin: (BlInsets all: 20);
			addChild: e]) size: 400@400.
]
