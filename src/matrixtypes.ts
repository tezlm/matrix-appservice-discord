export interface IMatrixEventContent {
    body?: string;
    info?: any; // tslint:disable-line no-any
    name?: string;
    topic?: string;
    membership?: string;
    msgtype?: string;
    url?: string;
    displayname?: string;
    reason?: string;
    "m.relates_to"?: any; // tslint:disable-line no-any
}

export interface IMatrixEvent {
    event_id: string;
    state_key: string;
    type: string;
    sender: string;
    room_id: string;
    membership?: string;
    avatar_url?: string;
    displayname?: string;
    redacts?: string;
    replaces_state?: string;
    content?: IMatrixEventContent;
    unsigned?: any; // tslint:disable-line no-any
    origin_server_ts?: number;
}
